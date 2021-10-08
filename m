Return-Path: <SRS0=sTTz=O4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B926C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Oct 2021 02:46:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B83D60FC2
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Oct 2021 02:46:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1B83D60FC2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JAErnzBAOp5e+/BdamF/zcmvTnxMULMxWVWbgYgfeHs=; b=EQsLpZiqqhaI66
	V3GMNXyK6GfssMHRgKZFN0PJ07y+uQcbetWZOIRoefoJPlCwjcJOcUcsPswwfB4lmnXf7In+96lRv
	ZOPmbBGjGt8bLpC1r6tl4/NVvSUIEEEAyBVp7qcHN6vN5Hr/2xKtsLDVaA30bohfiG7HKNlgYvXO+
	mqwcV9qvmziE0QnVrvWui2YciFteBNtte9TNoc+JnjeXSmm3HArXbjZvWmoAe1U/UPi+16xQ4o/9h
	mVmPGnMXd79KYRJ9nMc7MJ7hT7mAGlherCae1yZB3cE5BS2vs+lID3+im17/xK2iyHPWhT9ZKrxsz
	zynxZG/Z/ZO8z3U0cySw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYfu8-001LgG-9C; Fri, 08 Oct 2021 02:46:36 +0000
Received: from mail-ot1-f42.google.com ([209.85.210.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYftt-001Lbq-FA; Fri, 08 Oct 2021 02:46:23 +0000
Received: by mail-ot1-f42.google.com with SMTP id
 r43-20020a05683044ab00b0054716b40005so9976796otv.4; 
 Thu, 07 Oct 2021 19:46:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=WCH/ZvRJ095r2piVpiKap3cip9CDgRowlgzYoYtODk4=;
 b=t0BCowuhT1kT50nhSVo5b0HYkx0VGydMNkqJQ418H04RM769AE5euBWGeIRR+RW0rf
 JesTQRQhvkpx1QdDec56l/4oJjdWLfzAqgAhf4qI09Wz5xU997kWzv72fvs0sVfhBTyi
 js8RrecZBFQ/tFNi7daOkwgd0Wf77iECLvdf4TJnYZtCUYi70AqsNrjejcCwJcDPO/EB
 37mKtC6g8oIbCPLFYIYaUFUwTksZ4RonhIR0d8Hu1czK7nWkwdO3J4KNRnWz8yTe4Ypg
 ABDw4HvQrFJZGoqaJKSYnDaYc9orvQsrMDnXj63V3yOhA7xmd3WkdIPgn5BFVy7b9oMq
 vL0Q==
X-Gm-Message-State: AOAM530k/CFSIAiieOVs2arXc1UpLq3V4/IqMBwlDcTgeyL4UKXbX/x5
 tKkoDatswmRWYaDbiP0utA==
X-Google-Smtp-Source: ABdhPJw8aJTGTodhqaaRkMnbiMqq4zA5AnxSIR1dPlLXmJWPLZqAbAhjdJcXjZcWpq2dhcYcnx7A1w==
X-Received: by 2002:a05:6830:2781:: with SMTP id
 x1mr6391596otu.349.1633661176215; 
 Thu, 07 Oct 2021 19:46:16 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id h91sm261506otb.38.2021.10.07.19.46.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 19:46:15 -0700 (PDT)
Received: (nullmailer pid 1409598 invoked by uid 1000);
 Fri, 08 Oct 2021 02:46:12 -0000
From: Rob Herring <robh@kernel.org>
To: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Jassi Brar <jassisinghbrar@gmail.com>
In-Reply-To: <20211007130641.3589-1-Allen-KH.Cheng@mediatek.com>
References: <20211007130641.3589-1-Allen-KH.Cheng@mediatek.com>
Subject: Re: [PATCH] dt-bindings: mediatek: add adsp-mbox document
Date: Thu, 07 Oct 2021 21:46:12 -0500
Message-Id: <1633661172.621831.1409597.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_194621_541707_D5F567CA 
X-CRM114-Status: GOOD (  12.20  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 07 Oct 2021 21:06:41 +0800, Allen-KH Cheng wrote:
> This patch adds document for mediatek adsp mbox
> 
> Signed-off-by: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> ---
>  .../bindings/mailbox/mtk,adsp-mbox.yaml       | 71 +++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/mtk,adsp-mbox.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/mailbox/mtk,adsp-mbox.example.dts:22.44-31.11: ERROR (node_name_format): /example-0/adsp_mailbox@adsp_mailbox@10816000: multiple '@' characters in node name
ERROR: Input tree has errors, aborting (use -f to force output)
make[1]: *** [scripts/Makefile.lib:385: Documentation/devicetree/bindings/mailbox/mtk,adsp-mbox.example.dt.yaml] Error 2
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1441: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1537694

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
