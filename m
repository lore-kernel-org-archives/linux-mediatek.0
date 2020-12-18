Return-Path: <SRS0=+cmX=FW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04855C4361B
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Dec 2020 18:49:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFA1D23B08
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Dec 2020 18:49:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFA1D23B08
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nbd.name
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tB8UiDA4XyswJzJmXGru7q8s3G0K1yt9t/BIVtNDOHc=; b=B//tFM12Cd2VTfblXAvujTJEe
	G9LKWd4QwOs9Ls0VXec/c5UgYT/2BiGyxdwFjsEpPojSK2taeiVCn9SeBWAyod5Vow+IHjzla5JH8
	DFINkUQf33yii6zPZHmAtp8ydZ/tLD74CiYh7zaeiwnW+bpAI4SowdRTfzClIMsL+qWpfdmJG85ir
	tmNzhQjmcjXKJuqNbSa/bJVRdf1ofttmsDc6PIZCwVZ6LvViP3xhUgW2yGdbZw3P44VHerWUcZftJ
	GpfygTezx3XqUSQfIIjKL2E2AZft0w7+G9C7008Pwzwi5iwJhzziPU0X70Mp4HElnq/JiQVsv7gCX
	FM6HVF3IQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kqKoM-0000cL-8x; Fri, 18 Dec 2020 18:49:06 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqKoJ-0000ar-73
 for linux-mediatek@lists.infradead.org; Fri, 18 Dec 2020 18:49:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zRFXMkRycyC0MVrPiA/mwwIXpjM3W0G2IVjoa+Cfnm0=; b=teC4mz03EdIm/6Zt5z6VvfC9jp
 b6OafvRT5ZiiaXaVAjWNbgxVaOtY82YvTiYUcVQ1GqH4wmyZuaWB/SbKcufNVrY0gsXlycjBoOYke
 rXMGwN5dJlX5Z/okcp5oXGW201OhzLgo/maraGt/yaEvvX8rnImrGjsoXA/4BX5RSr34=;
Received: from p4ff13815.dip0.t-ipconnect.de ([79.241.56.21] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1kqKoF-0000MY-2a; Fri, 18 Dec 2020 19:48:59 +0100
Subject: Re: [PATCH] mt76: mt7915: increase buffer size to receive large MPDUs
To: Ryder Lee <ryder.lee@mediatek.com>,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
References: <00af8edba9bad0e3635ca6024fcf56b3bcd407f8.1608139125.git.ryder.lee@mediatek.com>
From: Felix Fietkau <nbd@nbd.name>
Message-ID: <9b4df998-b73c-011b-11cc-007785e3fba5@nbd.name>
Date: Fri, 18 Dec 2020 19:48:58 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <00af8edba9bad0e3635ca6024fcf56b3bcd407f8.1608139125.git.ryder.lee@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201218_134903_518939_E32C6C23 
X-CRM114-Status: GOOD (  15.68  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org,
 Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-12-16 18:24, Ryder Lee wrote:
> This improves 5G/HE Rx performance around 70mbps.
> 
> Tested-by: Chih-Min Chen <chih-min.chen@mediatek.com>
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7915/dma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/dma.c b/drivers/net/wireless/mediatek/mt76/mt7915/dma.c
> index 8c1f9c77b14f..a8c783be297f 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/dma.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/dma.c
> @@ -203,7 +203,7 @@ int mt7915_dma_init(struct mt7915_dev *dev)
>  {
>  	/* Increase buffer size to receive large VHT/HE MPDUs */
>  	struct mt76_bus_ops *bus_ops;
> -	int rx_buf_size = MT_RX_BUF_SIZE * 2;
> +	int rx_buf_size = MT_RX_BUF_SIZE * 4;
This will not be needed after adding rx decapsulation offload.

- Felix

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
