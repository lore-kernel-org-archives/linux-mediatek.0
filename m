From: Ryder Lee <ryder.lee@mediatek.com>
Subject: Re: [PATCH] mt76: mt7615: add support for per-chain signal strength
 reporting
Date: Mon, 10 Jun 2019 15:12:09 +0800
Message-ID: <1560150729.14203.11.camel@mtkswgap22>
References: <3912a2863e858f3623ced61737836e42c7b19149.1560071167.git.ryder.lee@mediatek.com>
         <d6cfd2e9-4b2b-36ac-6cae-a34f74204801@newmedia-net.de>
         <1560132590.28258.5.camel@mtkswgap22> <1560140541.5606.12.camel@mtkswgap22>
         <64662021-8e5a-91b5-9afb-3c9005564d19@newmedia-net.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <64662021-8e5a-91b5-9afb-3c9005564d19@newmedia-net.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Gottschall <s.gottschall@newmedia-net.de>
Cc: Sean Wang <sean.wang@mediatek.com>, Chih-Min Chen <chih-min.Chen@mediatek.com>, YF Luo <yf.luo@mediatek.com>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, Yiwei Chung <yiwei.chung@mediatek.com>, linux-mediatek@lists.infradead.org, Roy Luo <royluo@google.com>, Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Felix Fietkau <nbd@nbd.name>
List-Id: linux-mediatek@lists.infradead.org

On Mon, 2019-06-10 at 06:47 +0200, Sebastian Gottschall wrote:
> okay. curious is, that my variant works with sane results too.
> i will test your variant and check the results
> 
> Sebastian

Please don't top post as it's hard to track the thread.

More specifically, IBRSSI is obtained from packet's L-STF portion and
MTK HW PD (packet detection) will take it as a reference. (with
variation more or less)

As for RCPI which is calculated from packet's data portion. The other
MTK chipsets may use IBRSSI as their baseband couldn't report RCPI.

Ryder

> Am 10.06.2019 um 06:22 schrieb Ryder Lee:
> > On Mon, 2019-06-10 at 10:09 +0800, Ryder Lee wrote:
> >> On Sun, 2019-06-09 at 16:44 +0200, Sebastian Gottschall wrote:
> >>> according to my findings
> >>>
> >>> MT_RXV4_RCPI1 is part of rx descriptor 4 and not 3
> >>> so it must be rxdg4 = rxd[4] etc.
> >> RXV start from 1 in the code.
> >>
> >> That is: RXV1 <-> rxdg0, RXV2 <-> rxdg1 ...so RXV4 <-> rxdg3
> >>
> >>> however rxdg3 contains MT_RXV3_IB_RSSIRX which can be used for signal calculation.
> >>> i already wrote a similar code for this driver which i sended to felix a long time ago.
> >>> my variant looks like
> >>>                   status->signal = (FIELD_GET(MT_RXV3_IB_RSSIRX, rxdg3) - 220) / 2;
> >>>                   status->chain_signal[0] = (FIELD_GET(MT_RXV4_RCPI0, rxdg4) - 220) / 2;
> >>>                   status->chain_signal[1] = (FIELD_GET(MT_RXV4_RCPI1, rxdg4) - 220) / 2;
> >>>                   status->chain_signal[2] = (FIELD_GET(MT_RXV4_RCPI2, rxdg4) - 220) / 2;
> >>>                   status->chain_signal[3] = (FIELD_GET(MT_RXV4_RCPI3, rxdg4) - 220) / 2;
> > mt7615 actually doesn't use in-band RSSI for signal calculation, but it
> > occurs to me that i should modify the code to compare per-chain's
> > signal. Something like this:
> >
> > 		status->chain_signal[0] = to_rssi(MT_RXV4_RCPI0, rxdg3);
> > 		status->chain_signal[1] = to_rssi(MT_RXV4_RCPI1, rxdg3);
> > 		status->chain_signal[2] = to_rssi(MT_RXV4_RCPI2, rxdg3);
> > 		status->chain_signal[3] = to_rssi(MT_RXV4_RCPI3, rxdg3);
> > 		status->signal = status->chain_signal[0];
> >
> > 		switch (status->chains) {
> > 		case 0xf:
> > 			status->signal = max(status->signal,
> > 					     status->chain_signal[3]);
> > 		case 0x7:
> > 			status->signal = max(status->signal,
> > 					     status->chain_signal[2]);
> > 		case 0x3:
> > 			status->signal = max(status->signal,
> > 					     status->chain_signal[1]);
> > 			break;
> > 		default:
> > 			break;
> > 		}
> >
> >
> > I could send a v2 or you can take care of that.
> >
> > Ryder
> >
> >
