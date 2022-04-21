Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBF7AC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Apr 2022 21:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SzVpJfxr27lmVQz3q97rMpspvr4J/INFL8wO1CDgS8s=; b=AQ6PCbDgm0XYLd
	7X5f68lVzwg9NP35/5GHLRX/COvMi40nGhwIVq20c7OOvh1HgPQ/cEtMD5uQ0QGRAEVtrNiZwMfYr
	3dWp66aER9Kc3YPROj7mN75u79TAlP7aNff15h5ba1K+wFMER/i6kpzgX80iPSrmS6U3yccVcDjur
	MumUWOE82g0cpnGUQE2M2G8vlAJuTKzciAbFAxYfbN1JBMa3JkWfvlJm8i0H3gS8SGdIGPbkexjVA
	Li8f4ayf+8dadamSXI63+fV2u3i/oORr4fu0QzwlHMfjMBVCdmFHjMNizthvsQtlIDSOkhezbvVIo
	hPEJJ5Uo1gZnljf2q47g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhe8I-00F09U-70; Thu, 21 Apr 2022 21:14:34 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhe8E-00F081-Mi
 for linux-mediatek@lists.infradead.org; Thu, 21 Apr 2022 21:14:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c/02Q/vf5R3LFZzkS8JBR0foELszGqvAH/lUEI2ausk=; b=edEm6nmYj4x9gUS0C5+He5pF+/
 jSOofWu05NcKaT1KrzbtjDIqxltnmVOkNgdwtQQhF7wnzne5RZ+keeKNajfi+rUVv1lPG9SOTFeql
 OArLOAQR1xm+ISKZ7+lz/4ObNyeyKYd6EYWLHvs6QJKjCi9nizjGP3372mSgRPtvwg3M=;
Received: from p200300daa70ef20028a36ac9fd74af32.dip0.t-ipconnect.de
 ([2003:da:a70e:f200:28a3:6ac9:fd74:af32] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1nhe85-0006Ib-Gz; Thu, 21 Apr 2022 23:14:21 +0200
Message-ID: <f1b944f5-b440-d32e-84b9-7cb140b0adc6@nbd.name>
Date: Thu, 21 Apr 2022 23:14:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Subject: Re: [PATCH] mt76: mt7915: disable RX_HDR_TRANS_SHORT
Content-Language: en-US
To: "bo.jiao" <bo.jiao@mediatek.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Sujuan Chen <sujuan.chen@mediatek.com>,
 "lian . chen" <lian.chen@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>
References: <20220420071144.14573-1-bo.jiao@mediatek.com>
 <46f14357-d02b-cad3-9fa8-7e1962305251@nbd.name>
 <5b0f28fa67b27151a59ea42d9f60e29919f36f36.camel@mediatek.com>
From: Felix Fietkau <nbd@nbd.name>
In-Reply-To: <5b0f28fa67b27151a59ea42d9f60e29919f36f36.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_141431_032169_590C4C91 
X-CRM114-Status: UNSURE (   8.76  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


Hi,

On 21.04.22 03:44, bo.jiao wrote:
> hi felix:
> 
> mt7915_mac_fill_rx:
> 	......
> 
> 	if (!status->wcid || !ieee80211_is_data_qos(fc))
> 		return 0;
> 
> 	status->aggr = unicast &&
> 		       !ieee80211_is_qos_nullfunc(fc);
> 	status->qos_ctl = qos_ctl;
> 	status->seqno = IEEE80211_SEQ_TO_SN(seq_ctrl);
> 
> 	return 0;
> 
> it will be returned by the condition !ieee80211_is_data_qos(fc) when
> receive non-Qos (null) data, and the status->aggr/status-
>>qos_ctl/status->seqno keep the default value 0.
> 
> mt76_rx_aggr_reorder:
> 	....
> 
> 	sta = wcid_to_sta(wcid);
> 	if (!sta)
> 		return;
> 
> 	if (!status->aggr && !(status->flag & RX_FLAG_8023)) {
> 		mt76_rx_aggr_check_ctl(skb, frames);
> 		return;
> 	}
> 
> 	....
> 
> those packet will be forced to do rx reorder and may incorrectly update
> tid->head.
> https://patchwork.kernel.org/project/linux-wireless/patch/2022042010503
> 8.36443-1-nbd@nbd.name/
> Your replacement patch did not include this change.
> +	if (!status->aggr)
> +		return;
> +
> 
> Thanks.
I posted this patch: https://patchwork.kernel.org/project/linux-wireless/patch/20220420112524.52430-1-nbd@nbd.name/

- Felix

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
