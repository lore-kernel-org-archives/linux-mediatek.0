From: Sean Wang <sean.wang@mediatek.com>
Subject: Re: [PATCH] Bluetooth: mediatek: fix uninitialized symbol errors in
 btmtksdio_rx_packet
Date: Tue, 19 Mar 2019 02:02:31 +0800
Message-ID: <1552932151.24944.12.camel@mtkswgap22>
References: <8fb8e6840a39127112597963d665fbe6c21d8b91.1552509647.git.sean.wang@mediatek.com>
         <93CB6259-6FB8-4D3D-9FF3-8EB59499A6A1@holtmann.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <93CB6259-6FB8-4D3D-9FF3-8EB59499A6A1@holtmann.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Holtmann <marcel@holtmann.org>
Cc: Johan Hedberg <johan.hedberg@gmail.com>, linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On Mon, 2019-03-18 at 17:55 +0100, Marcel Holtmann wrote:
> Hi Sean,
> 
> > Fixed all the below warnings. They would probably cause the following
> > error handling path would use the uninitialized value and then produce
> > unexpected behavior.
> > 
> > drivers/bluetooth/btmtksdio.c:470:2: warning: ‘old_len’ may be used
> > uninitialized in this function [-Wmaybe-uninitialized]
> >  print_hex_dump(KERN_ERR, "err sdio rx: ", DUMP_PREFIX_NONE, 4, 1,
> >  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >          old_data, old_len, true);
> >          ~~~~~~~~~~~~~~~~~~~~~~~~
> > drivers/bluetooth/btmtksdio.c:376:15: note: ‘old_len’ was declared here
> >  unsigned int old_len;
> >               ^~~~~~~
> > drivers/bluetooth/btmtksdio.c:470:2: warning: ‘old_data’ may be used
> > uninitialized in this function [-Wmaybe-uninitialized]
> >  print_hex_dump(KERN_ERR, "err sdio rx: ", DUMP_PREFIX_NONE, 4, 1,
> >  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >          old_data, old_len, true);
> >          ~~~~~~~~~~~~~~~~~~~~~~~~
> > drivers/bluetooth/btmtksdio.c:375:17: note: ‘old_data’ was declared here
> >  unsigned char *old_data;
> >                 ^~~~~~~~
> > 
> > Fixes: d74eef2834b5 ("Bluetooth: mediatek: add support for MediaTek MT7663S and MT7668S SDIO devices")
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > Reported-by: Marcel Holtmann <marcel@holtmann.org>
> > Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> > ---
> > drivers/bluetooth/btmtksdio.c | 4 ++--
> > 1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
> > index b4b8320f279e..23cf63888bac 100644
> > --- a/drivers/bluetooth/btmtksdio.c
> > +++ b/drivers/bluetooth/btmtksdio.c
> > @@ -372,8 +372,8 @@ static int btmtksdio_rx_packet(struct btmtksdio_dev *bdev, u16 rx_size)
> > 	const struct h4_recv_pkt *pkts = mtk_recv_pkts;
> > 	int pkts_count = ARRAY_SIZE(mtk_recv_pkts);
> > 	struct mtkbtsdio_hdr *sdio_hdr;
> > -	unsigned char *old_data;
> > -	unsigned int old_len;
> > +	unsigned char *old_data = NULL;
> > +	unsigned int old_len = 0;
> > 	int err, i, pad_size;
> > 	struct sk_buff *skb;
> > 	u16 dlen;
> 
> or instead just remove this whole old_len + old_data stuff anyway since it is rather pointless. Or at least introduce a proper error path for sdio_readsb since you know when it fails, there is no point in writing the SKB.
> 
> Regards
> 

I will remove the old_len and old_data in the next version for the issue
because the error path for sdio_readsb seems wrong.

My initial purpose is that I would like to add a error path for these
packets which are successful at sdio_readsb but fail at packet format
parsing. I will update the error path for packet format error in
a separate patch.

> Marcel
> 
