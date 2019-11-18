Return-Path: <SRS0=+oxs=ZK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 609BAC432C0
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Nov 2019 21:32:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B226222EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Nov 2019 21:32:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O8NoF9zY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B226222EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8zKQkBh/kmIvtOstYr+87SP2mUhI6jyl7I4buKJW7mk=; b=O8NoF9zYSiCpSA
	h61m9NMAtgFh2snqjaSa0HrviNrekLsCGf+SAaPyX3SNSy+JGPFbXrNHmZbd1eqx27ECF/iCiCRWh
	VXJWIRlqnF8hdOK8j9pTDamDFRVqtalU2Fx5huEHyMVOdyQOJRQra9nWqK2SSVRq6nIyQGzbX16Ih
	cjMRDM+sCY8rv8/BfKIwI3xrY1SjDtMbuD3pBwRHREBMyNydlbWoK6uxVySIjgem1qvqVY/M/c74J
	35ey+bmtUWNr6wq4983nVZO4tbPVA+4GrcGw/mM4NPJjb8D071Hacaq+vJRUHJ36lzT3P1CEDA9Jr
	Zljahq74Kn2vLQbo0j6A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iWodC-0005VW-HV; Mon, 18 Nov 2019 21:32:22 +0000
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iWocv-0005FJ-Uf; Mon, 18 Nov 2019 21:32:09 +0000
Received: by mail-ot1-f66.google.com with SMTP id n23so15865848otr.13;
 Mon, 18 Nov 2019 13:32:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=qqYcsKRMT/Ofwu9p9gWIeiSVzyiJC1qQZAiQjgxWaa0=;
 b=MxTfCQLc04+cshY1L3vyjQ/pOoBxEAiieWqwIzbyOZ8w3TtwqJ7DJoJW18u5YPCk09
 eDw0INKq5Nnl0klsKFVT59Z/IXyFusWfsxTd7BLMtHlN6U42FdwilsckvAwXlecN/Phf
 MEFc+t4CLh3OCReQOsOBmAdZ+9cu152z+hsxHWbevtmf1qw/+FEmQuh2IUwDKp/oIWPf
 +rPMDkY35GO+9ltNMKEa02XGw8MKhshA/ZlfozzNOZv40kWZ0Sp6Sp01Oan+Rpb5ST8o
 n0pkeLcNhtZ1IKwyQf851ItkE11zt9GeXDoe2MiJugACRdPmGeZpGa1izuEuTi/+KHgy
 fGiw==
X-Gm-Message-State: APjAAAV8cMiv8hU18P2EB5XUGaP+IdBZwVbM/qA2uwssxg2E2Sf6WJba
 Qx9QNa7s1cNhKKfG19N7ig==
X-Google-Smtp-Source: APXvYqy5qVSVt+xh2wIzi24hrKLRfXyk0CYioZ9gFcoETioNwzK7Xkbr7IosaBgrxrtdWzERUqCG4w==
X-Received: by 2002:a05:6830:50:: with SMTP id
 d16mr1039391otp.132.1574112722863; 
 Mon, 18 Nov 2019 13:32:02 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id p3sm6570097oti.22.2019.11.18.13.32.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 13:32:02 -0800 (PST)
Date: Mon, 18 Nov 2019 15:32:01 -0600
From: Rob Herring <robh@kernel.org>
To: Ming-Fan Chen <ming-fan.chen@mediatek.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: mediatek: Add binding for MT6779 SMI
Message-ID: <20191118213201.GA27040@bogus>
References: <1573616362-2557-1-git-send-email-ming-fan.chen@mediatek.com>
 <1573616362-2557-2-git-send-email-ming-fan.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1573616362-2557-2-git-send-email-ming-fan.chen@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191118_133205_987885_08CA5EEB 
X-CRM114-Status: UNSURE (   9.69  )
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
Cc: devicetree@vger.kernel.org, Joerg Roedel <jroedel@suse.de>,
 wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Ming-Fan Chen <ming-fan.chen@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 13 Nov 2019 11:39:21 +0800, Ming-Fan Chen wrote:
> This patch add description for MT6779 SMI.
> 
> Signed-off-by: Ming-Fan Chen <ming-fan.chen@mediatek.com>
> ---
>  .../memory-controllers/mediatek,smi-common.txt     |    3 ++-
>  .../memory-controllers/mediatek,smi-larb.txt       |    3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
