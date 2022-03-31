Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B995CC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Mar 2022 16:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:To:From:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=icTrxrT77U3jWAsQpMIeQRogN5LPZO/aJQ80rZUTwhQ=; b=iDwbFHVfCqlbFk
	HdW8PpSPK0nkc9lYliGoeL3lBQVQA4798/rRWavRR9Qh4X9niIhNUCl7rOtnKMot9V4C58bRlNQt6
	Zuth2Igvr8w6T+QDGW+1ld/7AQv82AJpK3yHw6kHEHZ/cKxIMoCrTk6sLnR/1JQZGYPvzt/Z5ZX0R
	YnE4sU+H2BkHUJVHKYeSIodApm0/XbTIuZnKWZKDHqCLUrEzNYURU6BCpWkW30FDMKRbI+G54Gmw3
	zz4FSZRen+r3bPb1pF+9wLaP9ATuLMWIVfEzhH4qpTdu7SXT4L26hsRuJq9eyS4YGfQpzh469QWth
	5ZXPS0peq0aGW5AwaLpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZxIm-002tID-Qp; Thu, 31 Mar 2022 16:05:36 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZxIk-002tFR-QN
 for linux-mediatek@lists.infradead.org; Thu, 31 Mar 2022 16:05:36 +0000
Received: by mail-wm1-x334.google.com with SMTP id
 l62-20020a1c2541000000b0038e4570af2fso1435660wml.5
 for <linux-mediatek@lists.infradead.org>; Thu, 31 Mar 2022 09:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:from:to:subject
 :content-transfer-encoding;
 bh=iOKudd1iIEzLa5iSeJQ9bvKHoN1X3ml+guwWlICVFnY=;
 b=jfvXXSqr5yShK6qN98s/uoRWpQBXWoqI9bQ2SxgiWyDkVibZTF4j6QZz31AuPyvktV
 hGO1rmxNq7yJnAi4Vywr6hVacTzSfuyrw+m3sjbJ58x2U0AehyP6eScanepEC7azMCSy
 eJRWtqu+ivArgByWnzemknkS2fVVBKWVWzRK23+x62wElKQGLSeCGbPSLZ8HcarQ0BlX
 IQ5c7HLcBMnrIyRWVjcnCxl7Z+FAQhO4He6u1BYrqd0MBYB2t+bAe/FUzIDYszJhGtjQ
 Q/r/KZ+UnyaRBrdjBbznnA3OAdu0cntUrf+1WtCcOo1/1oVkj/Sh5r2alWiFgTUYnM0A
 czjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:from:to:subject
 :content-transfer-encoding;
 bh=iOKudd1iIEzLa5iSeJQ9bvKHoN1X3ml+guwWlICVFnY=;
 b=i8zCJfpQ999Me7EFq/g5DFfdAiXh7iPvyIEL1YJZG1dozXT972rXQSv8e7H5phoaAZ
 nGS7LFKyCj9QNxkeOJkPN0dS+bFyu+SZw62IfZ7q/9TOHexW75x0W3fRE3XIUQvApa6L
 fnYQVgSuWUm5nmkdyqfTJD1fSN0gv/SX/UoQP4N6dGVSCXDLoD7AoYOjIsaP9mVp+OQp
 UbHkukPSHNtc1SAdsicdT4y4N0p50fD9mEyqcWsihv7YnzuzBEaE9aSZ6NyAywWeyFGT
 pCKzKSl9PTorsYf9meV3BViCv+1/gtnq3EGz7GpXCrR4U//LeaHlJ6qhe/DFdpf9rF3l
 2Zqg==
X-Gm-Message-State: AOAM5334LsBROHp4FMB6aw4GZxg7bh5V/SrVaU2HLdhL6xR/7c4tkHS/
 R7pnmkaBkWVx5QwwYGCaSKWE5f+NmH0=
X-Google-Smtp-Source: ABdhPJwngG9Bhu+QdPNeXlOohoXCzOXAd7zr+QdP0lX51TrJnD2cLn7SGqfbmcIgZg5w+7KnzYvIpQ==
X-Received: by 2002:a05:600c:4f0c:b0:38c:bdf5:2232 with SMTP id
 l12-20020a05600c4f0c00b0038cbdf52232mr5462218wmq.90.1648742727936; 
 Thu, 31 Mar 2022 09:05:27 -0700 (PDT)
Received: from DESKTOP-R5VBAL5 ([39.53.224.185])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a1ced03000000b0038ce57d28a1sm7534447wmh.26.2022.03.31.09.05.26
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
 Thu, 31 Mar 2022 09:05:27 -0700 (PDT)
Message-ID: <6245d147.1c69fb81.51580.0059@mx.google.com>
Date: Thu, 31 Mar 2022 09:05:27 -0700 (PDT)
X-Google-Original-Date: 31 Mar 2022 12:05:27 -0400
MIME-Version: 1.0
From: frasierdreamlandestimation@gmail.com
To: linux-mediatek@lists.infradead.org
Subject: Estimating Services
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_090534_888680_929D0FDA 
X-CRM114-Status: UNSURE (   2.58  )
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

Hi,

We provide estimation & quantities takeoff services. We are providing 98-100 accuracy in our estimates and take-offs. Please tell us if you need any estimating services regarding your projects.

Send over the plans and mention the exact scope of work and shortly we will get back with a proposal on which our charges and turnaround time will be mentioned

You may ask for sample estimates and take-offs. Thanks.

Kind Regards
Gavin Mcalister
Dreamland Estimation, LLC


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
