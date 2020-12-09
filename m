Return-Path: <SRS0=7tkd=FN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B76AAC4361B
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 12:12:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DD3623B7B
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 12:12:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DD3623B7B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FxfeJomgGZl4cpi2W/PsK3Xc03XGsTEtawMCCwXYaks=; b=HnY0PGCI0W1EtCOeT9+TbcJar
	RN/OHhNCMSo7f+1xaLFrlqhj3kR3uL942rQRDEK7xEJD3m2Wy5uIBIsxpen/8aNlvautR9JSDFbOS
	1YPNNJ+L6nSkP8+xk5bks+F0qvku5vPjuvFMndsZKhLsUry69FWSM6KGlbzO6a5vCYaXu9Y5Rj6W5
	pENrFts2t2o3YcUqfzjPYcX9Tui8iLl9oRJLjuBCc558BySCKzxA3Pla2TfSVZ24CGd6kW3D6lAS1
	FbPuwYEcro7ux+Tf+NTgP4IIlW4yVPHx2tjgoPTJaDiIUZkNOgNgCECUY4io3H2yGeOvB0EluOOwN
	C73NEFixA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmyKX-0004Si-Mr; Wed, 09 Dec 2020 12:12:25 +0000
Received: from mail-wr1-f68.google.com ([209.85.221.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmyKV-0004S9-Ko; Wed, 09 Dec 2020 12:12:24 +0000
Received: by mail-wr1-f68.google.com with SMTP id m5so1485801wrx.9;
 Wed, 09 Dec 2020 04:12:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YzNq/OrRULxzTzwcpqVhoNHAyvtCdZCJ/sWJN5KPKoY=;
 b=c1dTEpcL9a/1uMjUHpIiY0RB7fxcszSUhfEAMBqCiK09iVmw6uqrrCwOkR/VB11ppx
 HIQGVZLcRnyxl6qAH8rBUA1r5f8tVlnzSP4XMrnVJ7p0Xg8AsSIIKuPHu0EYDwPbo/+K
 lthf6ZLymDxi6IdJr7JdByMFByndaYm+xX7QqqmyBvs7LAtak0coIyYbLmwWsc2p2CKu
 qFHb9XxSjIxc8MscHKAd3GdWFmRWMBuk3tNzVpjML7odUNFHcgc6Gd+C0fgMdMrl57CH
 ZGp4Ifen+ic0cmAcNo8nesleI40/o0hr0MTVU7jNnAGa+yciX2ccGPT7uq8C+5+fuEZK
 B94A==
X-Gm-Message-State: AOAM530xh/S6ioA+5FoASZZ6dhg4XSUzV+sHX9JvDBT5cdUEcpZwh2d5
 WIkQLIgSn8vSQWPlqu6HdRs=
X-Google-Smtp-Source: ABdhPJyzVn9lT40VQ7tMQlRCoD8HI7BETLODhLoHSG3uMDmE6uPI+MIyct0aSvhiEK8h7LXVs1QvpQ==
X-Received: by 2002:adf:eac7:: with SMTP id o7mr2414611wrn.23.1607515940605;
 Wed, 09 Dec 2020 04:12:20 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id 90sm3087627wrl.60.2020.12.09.04.12.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 04:12:18 -0800 (PST)
Date: Wed, 9 Dec 2020 13:12:17 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v5 05/27] dt-bindings: memory: mediatek: Rename header
 guard for SMI header file
Message-ID: <20201209121217.GA25951@kozik-lap>
References: <20201209080102.26626-1-yong.wu@mediatek.com>
 <20201209080102.26626-6-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201209080102.26626-6-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_071223_707759_4B7B8663 
X-CRM114-Status: GOOD (  11.28  )
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
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 anan.sun@mediatek.com, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Dec 09, 2020 at 04:00:40PM +0800, Yong Wu wrote:
> Only rename the header guard for all the SoC larb port header file.
> No funtional change.
> 
> Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
