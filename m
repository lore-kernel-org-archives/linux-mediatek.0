Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCBCAC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Mar 2022 10:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UBZPyT5zHSVHNdfwzUSdrtApvPL6U03BsXBXCiP5vZc=; b=ysxELVvTpGPdHa
	qtwzmNtqZKs5XDsiIk4EKjbWStzW+HfJ9LfQhZLjuyOAN68xgnlO4+86UThDULc+n5LwIJt/Oo3lF
	+XQhkeUmAj9JOMdHp2coQyBqrDN7lMmt/BMXeIEDRhe1YGh5SCmKOIbR3f7Q3ueHj4BKrYl3FjkZY
	wqcHr1ZQ/Q1wr58Io9d8ZfJsCBtc/V9aSgbxwfGAbXqnDkknxgoDepQXSqMvziQ350H5jJ/CrFg2W
	/iDVJDCmqVKornyG14i/Iai0snD+vLTSaSCqDIm8RHhSYjiLJfAN/31WmSH5//QePkCxGL47+w86V
	56m/XDc88VdmuI8FNfHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXKZJ-00GCsd-Fd; Thu, 24 Mar 2022 10:19:49 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXKZH-00GCrx-6x
 for linux-mediatek@lists.infradead.org; Thu, 24 Mar 2022 10:19:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648117185;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1gJjOobX3SRbiNCeHg0LuvpgzFcZz0S0lDQOV3qNy6Y=;
 b=jCwOdCF01Enfh2VL6iAddQRLATYeY9+wkVVhRp9ctyj+vMoB5xZOa+GcS7ff8Z7qJwtlXo
 Tj8y2okqeHJ/4zfKPz/v3nzHGHOW1+bF9cAPR/ULW2QYgD7oJWtKFvN2V2JuOfzBatGS0j
 EvqFCKpHmXWZ35l9NnJVLeLwImkj8ho=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-408-CqGwkUWkPoyjatvf20pX_A-1; Thu, 24 Mar 2022 06:19:43 -0400
X-MC-Unique: CqGwkUWkPoyjatvf20pX_A-1
Received: by mail-wr1-f70.google.com with SMTP id
 o9-20020adfca09000000b001ea79f7edf8so1513952wrh.16
 for <linux-mediatek@lists.infradead.org>; Thu, 24 Mar 2022 03:19:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=1gJjOobX3SRbiNCeHg0LuvpgzFcZz0S0lDQOV3qNy6Y=;
 b=HCRIk0+txChJ6B69O4VACkNLC5d3L1UofS27eVku49fiJW3ftRZqlGjq4+/Iw05Y3d
 DDw+ShHnxrdv6GAR5YA2Yg2RYZKDNY5HaSWfJhPWkLH6V03SJe3RmzGucXQKdymqmGfW
 iBMGFABFOcEeiaJW/vo/evbraN42rAm9bcJVLnLbA6zTblmgpi6StjJWja/aeGq0tA9l
 A0rYc10B6a3yBU/MKUJ4th8QzmrCgO4m8jDW/RBK1LQu0LiJzPnDDhbg2KJJ/mIZeXlL
 mERoGcIKLzeOgUWEuVAuILxC8nt1UahPFGE+lRCSJPkkxEUqG2BxAyZRHwDAqZ8p8Yc6
 pswg==
X-Gm-Message-State: AOAM533kCw0pppF6zmat4T6KUtQcWUOwUpKKHxBUicHlWcL7YY1Y5hnt
 3Mf8UzjeU26YtOyzWPexCZOfyPM2NMzNP+NeqGiX43mV5mUzhENrdq3xSL8cWL2gX3OQnTUrqSI
 E55qROpIslxK86tGl6L6smKVNM6bQWjuE
X-Received: by 2002:a5d:6149:0:b0:204:4a17:bf2 with SMTP id
 y9-20020a5d6149000000b002044a170bf2mr3964816wrt.379.1648117182645; 
 Thu, 24 Mar 2022 03:19:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwWi/GlpLsx0oVqY3VxN1g+/kbaTkjtYq6DyeMLoEDu/imv7vhTr7Ns2WO/c/diJleL3cUk0Q==
X-Received: by 2002:a5d:6149:0:b0:204:4a17:bf2 with SMTP id
 y9-20020a5d6149000000b002044a170bf2mr3964767wrt.379.1648117182208; 
 Thu, 24 Mar 2022 03:19:42 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-232-135.dyn.eolo.it.
 [146.241.232.135]) by smtp.gmail.com with ESMTPSA id
 f7-20020a1cc907000000b0038c756fe683sm5649938wmb.43.2022.03.24.03.19.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Mar 2022 03:19:41 -0700 (PDT)
Message-ID: <4f031821d48501f06ca1e7c6a91101d7c341f1d7.camel@redhat.com>
Subject: Re: [PATCH net-next] dt-bindings: net: snps,dwmac: modify available
 values of PBL
From: Paolo Abeni <pabeni@redhat.com>
To: Rob Herring <robh+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com,  macpaul.lin@mediatek.com, Biao Huang
 <biao.huang@mediatek.com>,  davem@davemloft.net, Jakub Kicinski
 <kuba@kernel.org>
Date: Thu, 24 Mar 2022 11:19:40 +0100
In-Reply-To: <20220324012112.7016-2-biao.huang@mediatek.com>
References: <20220324012112.7016-1-biao.huang@mediatek.com>
 <20220324012112.7016-2-biao.huang@mediatek.com>
User-Agent: Evolution 3.42.4 (3.42.4-1.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pabeni@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220324_031947_379505_E63B9681 
X-CRM114-Status: UNSURE (   7.98  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello,

On Thu, 2022-03-24 at 09:21 +0800, Biao Huang wrote:
> PBL can be any of the following values: 1, 2, 4, 8, 16 or 32
> according to the datasheet, so modify available values of PBL in
> snps,dwmac.yaml.
> 
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>

@Rob: my understanding is that this patch will go through your tree,
despite being marked as net-next. Please correct me if I'm wrong,
thanks!

Paolo


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
