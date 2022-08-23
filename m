Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22E62C32772
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Aug 2022 10:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rL8SJbgibVkoZ2njYSulQFsOA3EsniOZm6ohlbk2wZI=; b=qbgNl9z5npUMbqg0jJeoBTzilU
	h0jpw2omChyoP9vT6/TEndTDB9AHoBEg9n5sToHILjSA+z4TabwrnkK20z/qgXKsYlj+nhO44/IsH
	VSZyo/sCumw5bKWKvSIrYcRcTzYuJv8ka9WyVe82/Y6+CdbiERW0UrqTpVMto3xqQW7TkmxNmyonk
	ihTD8n4Vvz+qmxsVfjtdZYgvSATuttj0YF8acAN6fhHQnh4wTbkkxd1hQ1klE7tuuR5BeXMCXeitL
	aCdTb+/3t/gnWTlTaYZhP5DJWSndcsKfJnEtqHVg5JFvLnmpddBvRZFZ2gT9MwBtXta7LZMsAGO7y
	BFzQhamA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQRMr-0052aF-Oe; Tue, 23 Aug 2022 10:42:45 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQRMp-0052Y6-7C
	for linux-mediatek@lists.infradead.org; Tue, 23 Aug 2022 10:42:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661251360;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rL8SJbgibVkoZ2njYSulQFsOA3EsniOZm6ohlbk2wZI=;
	b=IDHJf7gnGiZjsSq5K5RWgkPxvtgdU6BN2PZYrpIUNCSit2MxUhJ5m/5DVM4DjFBtx8U7R9
	nrVxqchZKzYd66Yu1iq3VcjWAYLIWgv3n6NcUHlTAMuQZ8X9umslGmoGMpT+RJBH7M1tIi
	PsyyS48++8F94pTy/Ws5+mFSXsL2Lxo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-13-0Fio7xMWOY2UWVENEaxVhw-1; Tue, 23 Aug 2022 06:42:38 -0400
X-MC-Unique: 0Fio7xMWOY2UWVENEaxVhw-1
Received: by mail-wm1-f69.google.com with SMTP id j3-20020a05600c1c0300b003a5e72421c2so532340wms.1
        for <linux-mediatek@lists.infradead.org>; Tue, 23 Aug 2022 03:42:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc;
        bh=rL8SJbgibVkoZ2njYSulQFsOA3EsniOZm6ohlbk2wZI=;
        b=k8A3c4AS5oMmbZB5ahQVSFlI9FI1wp7S6jd8A87hVyLLIjfeGu7emiP/Hm1lcD8dNK
         os2wbmGoY0lpiOsPTx4FUt6KgWUrR1dlTqHkjvFTCHjLq6/5bUZVEhkeiFNhk1doofF+
         rCOhQCtOBkBZDbQ2EmLW/2S4ITOfedmwfo/MxiSznjOxEhosV3GFXinbPEN6laWGPH/J
         0KTg+Ha+RfGvJ1DOkznbtLrNfdyeVtk7Y/ARyu4dU/VU4R/hIgTk/N8OQhLHrYa+HkDF
         qf0J6k1ysqvSommiDRjl1RdTnRMWxHPRgP5jgUqHQWkivt30ws+AjA1MQOYcGrEW5wS/
         gh+g==
X-Gm-Message-State: ACgBeo0Xde3rXrjIP/LzYIb3u/X5woGLivrcHERs8weA10p6KCDHf0W5
	Nol8ywVIXec8wYDH48WOtZPy1WrPUNKFrvXK2D/uPOt6y9YSQ9iVyoXeHGlzc2kbGofE2qe6vpX
	Y05Wr6xMhg8F852HkVeUVUmMM5fBcPEto
X-Received: by 2002:a05:6000:178f:b0:221:7dcb:7cbf with SMTP id e15-20020a056000178f00b002217dcb7cbfmr13267570wrg.58.1661251357623;
        Tue, 23 Aug 2022 03:42:37 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6HEWu5qW/d+rzi2SfObMW+7Cw8xxikVX1LMuZMnMjuXybMaFefYdUhprqmbI+ylFucll3hJA==
X-Received: by 2002:a05:6000:178f:b0:221:7dcb:7cbf with SMTP id e15-20020a056000178f00b002217dcb7cbfmr13267545wrg.58.1661251357353;
        Tue, 23 Aug 2022 03:42:37 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-97-176.dyn.eolo.it. [146.241.97.176])
        by smtp.gmail.com with ESMTPSA id c7-20020a05600c0a4700b003a342933727sm9273171wmq.3.2022.08.23.03.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 03:42:36 -0700 (PDT)
Message-ID: <abce7e128957b3e86a6d73a7b383b6404ba2db65.camel@redhat.com>
Subject: Re: [PATCH net-next] net: ethernet: mtk_eth_soc: fix hw hash
 reporting for MTK_NETSYS_V2
From: Paolo Abeni <pabeni@redhat.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>, netdev@vger.kernel.org
Cc: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com, 
 Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com, 
 kuba@kernel.org, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org,  lorenzo.bianconi@redhat.com
Date: Tue, 23 Aug 2022 12:42:35 +0200
In-Reply-To: <890fc9b747e7729fb6b082a1f7fd309a58768cca.1661012748.git.lorenzo@kernel.org>
References: <890fc9b747e7729fb6b082a1f7fd309a58768cca.1661012748.git.lorenzo@kernel.org>
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_034243_404564_58C35FB5 
X-CRM114-Status: UNSURE (   6.91  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello,

On Sat, 2022-08-20 at 18:27 +0200, Lorenzo Bianconi wrote:
> Properly report hw rx hash for mt7986 chipset accroding to the new dma
> descriptor layout.
> 
> Fixes: 197c9e9b17b11 ("net: ethernet: mtk_eth_soc: introduce support for mt7986 chipset")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

This looks like a simple fix and the commit pointed by the 'fixes' tag
is already on -net. Would you mind to repost this targeting the
appropriate tree? Or there is any special reason to target net-next
instead?

Thanks!

Paolo


