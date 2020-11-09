Return-Path: <SRS0=FEjz=EP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 697D8C2D0A3
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2020 16:07:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DCB2206CB
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2020 16:07:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gmwlT9Vl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0DCB2206CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9+eqFM/GhZowvmVMlaLTHB9rV2526YM+2/1x+pq3Iqo=; b=gmwlT9Vlgx/nL2DsIj/LOyD0W
	Wf0FP+B03LUD7MfUViVJ7N+0ocgstgsw9vkEFbiYAFPrOHWYiIIBYZnhf2KsrnWHDtBjtrzrxAC+h
	aF7KdgBwIsWFvjUS3RCKrY0R397AUGLVEvaN0LSjZGpnnIk1T4fMbFQoi0SkVybBmE2+gg8RLksFp
	ofRNCdCRGVVtjKNuWGvNoMqMbAioQ2wdNfxLpxzDkIHERhqN1PHmNSp8Sc7XWyfE6uQWUZ6Zm4iuj
	J4C21ZkgANiN1SE80LZ6q865zVu3cDlvEUkIbmTkhR0bwXkJqgrkaki5kyzKm1Z9TNXM+A8LmHSmx
	6T0eyIKqA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kc9hq-00077G-30; Mon, 09 Nov 2020 16:07:46 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kc9hk-00074i-Bn; Mon, 09 Nov 2020 16:07:41 +0000
Received: by mail-ot1-f65.google.com with SMTP id n11so9426145ota.2;
 Mon, 09 Nov 2020 08:07:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Wl+eg2VZccrg0Qat3l8zqj7949X5nB65JyVfX4x8H3w=;
 b=nJ67qFgrhyZb52ZX3Lb+EToDjjcsi+sc+qnVKGvEUAgOrw13/3DlREtPFzp0zit8ZB
 Mc8YnBUJag32dmkL2iO0m1lPQgwneNhCOPcBASY30vPMpr+pBwG8SPR3RL0gKc2b14Rv
 7Ur5pnOOhi8xBCP0PDwl6g5hqjhMpxCIhFZ2G1mL8tuYKFHzC08hO2JaJfMsEOZrMGGQ
 3nO9NPK61bsc5mCrpO1U/H0W1cFE9Ht4xwq+/2tXwgA6T9Z16+eDuOU5GQ4rzN/xWfrY
 mlic+K2YdKFYURSXANEsMDb+ZPTdeEljcH0PTe6x90ErunJYdo4GucQAQuZ8XOjXZ4dB
 fJvw==
X-Gm-Message-State: AOAM532IAm4wcyjlxR1zyemuqOY7xBz2uavX/iTOXr48A0/KO7LLe2sm
 QsJ6ZOGF3auBncc6Z1/2TQ==
X-Google-Smtp-Source: ABdhPJyQMzS871G4Spg4tIzcHvS5D15p/CoyoX4vkMxrd9bHDwbRzKn8uTbCqErsbcSuln3XvGzuEw==
X-Received: by 2002:a9d:5c0c:: with SMTP id o12mr10881779otk.275.1604938059184; 
 Mon, 09 Nov 2020 08:07:39 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id y35sm2601629otb.5.2020.11.09.08.07.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 08:07:38 -0800 (PST)
Received: (nullmailer pid 1375401 invoked by uid 1000);
 Mon, 09 Nov 2020 16:07:37 -0000
Date: Mon, 9 Nov 2020 10:07:37 -0600
From: Rob Herring <robh@kernel.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: power: Add bindings document for
 Charger support on MT6360 PMIC
Message-ID: <20201109160737.GA1375361@bogus>
References: <1604400091-14618-1-git-send-email-gene.chen.richtek@gmail.com>
 <1604400091-14618-2-git-send-email-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1604400091-14618-2-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_110740_445992_924A1604 
X-CRM114-Status: GOOD (  11.30  )
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
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 sre@kernel.org, linux-kernel@vger.kernel.org, cy_huang@richtek.com,
 benjamin.chao@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 Wilma.Wu@mediatek.com, linux-arm-kernel@lists.infradead.org,
 shufan_lee@richtek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 03 Nov 2020 18:41:30 +0800, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
> 
> Add bindings document for Charger support on MT6360 PMIC
> 
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> ---
>  .../bindings/power/supply/mt6360_charger.yaml      | 48 ++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/supply/mt6360_charger.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
