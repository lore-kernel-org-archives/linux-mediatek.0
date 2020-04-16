Return-Path: <SRS0=NHOn=6A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E3E7C2BA2B
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Apr 2020 20:46:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FE1E221F7
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Apr 2020 20:46:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VjN+hb5f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FE1E221F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2vvzQgsPOORjk9uNJ5d6L1hCQ+jUTDZWlixfK27CitI=; b=VjN+hb5faWQGBD
	xulLJc5hRlBx/jw2EpdO3CWQw+YPlU+72auwfXguq5eZsM+w88HsrLWgDL5XWSK7c8TV8xgr85Qkm
	bXUc9/IKNNoSJ3vVIpYo5xq22Odp4ALBX+53UawG+XB/kRk7utQrTImxyc74mkm/o/GKdZh69/0nJ
	NPurdZj3GIuVpYHtFTG+AUvlhTv9gUWwRwdGXvGDDlRYMgu5Ug+ks4eoCP5KoYFZr8YkGdhj4zzU0
	or43o4CJvUPGOq8J63Ld3QAp0poV1HJIZMArr9PMx+oYYfMfCYEt+HkLm/KoWrkZ4BiZ2IKhggu2H
	tujLn8tO4oNB8Y2lKrzA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPBOX-0001c3-I4; Thu, 16 Apr 2020 20:45:57 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPBOO-0001Ta-6t; Thu, 16 Apr 2020 20:45:49 +0000
Received: by mail-ot1-f65.google.com with SMTP id j26so4300032ots.0;
 Thu, 16 Apr 2020 13:45:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=uNp2FEE1PLVvPcRli4Kxfk/uC3bIO5nhdJmFaCVvZ8Y=;
 b=sEx7vkVcqpoChhIYGNAg0VsbjLxqbKMCU4+LtZworvPrVYlu5hHz4zM0wurAWEloef
 3N03sH0zXVMYcpf9N87VsnnJTmI5rtyfElnudCBL/AqiMW2Cmt2s43fx9oiAn/2xz+O2
 M+p8qrQcI3C0I7dDeWiHvs9J9beZ+DWFYPvem/hzkDG5P6upNnPKQjxhqWjx/2LuTOg3
 atBUGLXj08+jGS9PrNN/mIO96xsVPjmyrwod2TzqteDyeR1X8SrefKsaZF2f9YhTMvoU
 zrYuqCgd2Rj5o1XewqOjAwyD/mVHU5UFs2C0ABx/GpiS8jEodsimGelf+rTBbp5mHvTT
 CLVg==
X-Gm-Message-State: AGi0PubMeLQoLqE5x78Jwdj5EcjdkMWjp+EzpeHFsyKqelF4o3iKu92h
 G6VCGfda9TZDTEPLI2YeIA==
X-Google-Smtp-Source: APiQypK5AKz1ujNN52aZa37611roc3sbyihjxaYggNSCUvmDTZoTUNxSsPeEJfql3QtvsIAeOCVY9A==
X-Received: by 2002:a05:6830:1599:: with SMTP id
 i25mr2759otr.188.1587069947265; 
 Thu, 16 Apr 2020 13:45:47 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id f45sm7402999otf.30.2020.04.16.13.45.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2020 13:45:46 -0700 (PDT)
Received: (nullmailer pid 19615 invoked by uid 1000);
 Thu, 16 Apr 2020 20:45:45 -0000
Date: Thu, 16 Apr 2020 15:45:45 -0500
From: Rob Herring <robh@kernel.org>
To: Anthony Huang <anthony.huang@mediatek.com>
Subject: Re: [PATCH 1/2] dt-bindings: soc: mediatek: Add document for mmdvfs
 driver
Message-ID: <20200416204545.GA19079@bogus>
References: <1586949506-22990-1-git-send-email-anthony.huang@mediatek.com>
 <1586949506-22990-2-git-send-email-anthony.huang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1586949506-22990-2-git-send-email-anthony.huang@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200416_134548_248628_8BBE1FD8 
X-CRM114-Status: UNSURE (   8.21  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Anthony Huang <anthony.huang@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 15 Apr 2020 19:18:25 +0800, Anthony Huang wrote:
> This document describes the properties what mtk mmdvfs
> device node support.
> 
> Signed-off-by: Anthony Huang <anthony.huang@mediatek.com>
> ---
>  .../devicetree/bindings/soc/mediatek/mmdvfs.yaml   |  198 ++++++++++++++++++++
>  1 file changed, 198 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mmdvfs.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/mediatek/mmdvfs.example.dt.yaml: example-0: opp-table-mm: {'compatible': ['operating-points-v2'], 'phandle': [[1]], 'opp-0': {'opp-hz': [[315000000]], 'opp-microvolt': [[650000]]}, 'opp-1': {'opp-hz': [[450000000]], 'opp-microvolt': [[725000]]}, 'opp-2': {'opp-hz': [[606000000]], 'opp-microvolt': [[825000]]}} is not valid under any of the given schemas (Possible causes of the failure):
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/mediatek/mmdvfs.example.dt.yaml: example-0: opp-table-mm: {'compatible': ['operating-points-v2'], 'phandle': [[1]], 'opp-0': {'opp-hz': [[315000000]], 'opp-microvolt': [[650000]]}, 'opp-1': {'opp-hz': [[450000000]], 'opp-microvolt': [[725000]]}, 'opp-2': {'opp-hz': [[606000000]], 'opp-microvolt': [[825000]]}} is not of type 'array'

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/mediatek/mmdvfs.example.dt.yaml: mmdvfs: 'clock' is a required property

See https://patchwork.ozlabs.org/patch/1271100

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
