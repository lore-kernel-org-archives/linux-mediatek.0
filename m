Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C522C7EE32
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Jun 2025 12:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cYR0mvGjbB1t9PwMrSYQystitWjrVQqAGcccPxG+GgU=; b=mWGCJgEe0JGGfOfSmoaxEXqPBf
	Cj7Dir26rSEYKX0tYVhmX9a7NzKePk3R+3g6pORq3Io1+KBmIui4BCAJQz20KQuaWqGvSeZ0zXSiS
	BTinBxQzQPzS/MBU5dJCcVUh0TbVnzbj8rumWu+RzWrlufoNKjQG+aCw9BZSGygVtvIUclLXJJ0fx
	5nCZVLQ0hReqziwcLYdlitPse37XFpJWyDZ0glam5NsmXvt4Gd5wFesnywMcNpErXUG+6qb0TEW5p
	IC8BGnbMB9g88HgcuDpfO/UvUnGLex2oXiO5hqQXTA99bTAYIZM3XmeVhne5C157hOPeUuvwOD7BT
	sJFwjJRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU2nc-00000005aOs-20jb;
	Tue, 24 Jun 2025 12:30:52 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU2fn-00000005YkU-0Ec6
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Jun 2025 12:22:48 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-ae0b2ead3c6so5163066b.2
        for <linux-mediatek@lists.infradead.org>; Tue, 24 Jun 2025 05:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750767765; x=1751372565; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cYR0mvGjbB1t9PwMrSYQystitWjrVQqAGcccPxG+GgU=;
        b=UVKLBThi4BjoK70yMT9HB3/xjMqD9smGbpDZg8fpYIDVBNyxlIhZ0GNIScG4z/qOsl
         qschdX17U5y1m/H+Gu89Dkx+G2cS7EPpO3ijxUH1bvyIlmJvrSzakVcPfi5Q61IcD75d
         HYCY6A/y2Ff5+7XokPX6nHRm20LNcY5U8m+X8HvgU4lGy8HEND7ARrC0gmqhZeq43YS6
         i0i/abH3BqfJhi8AOizQCRj6bnuYge4htD+6PE52YW/bbLV0MB6/ViZ9/HyFMpZ/R+l6
         SUBXhPMRea7AePakoQBEGtxPqvb/wnpoPVuu0KpQ8iA6je+xDvwSPla9yMieY3AsaxjE
         LGNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750767765; x=1751372565;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cYR0mvGjbB1t9PwMrSYQystitWjrVQqAGcccPxG+GgU=;
        b=TLllJsJCe2NL8q9LEf57R2n21MLu6j+NVhmR0s4qvZMJfZYoyCe1S5jVDtT/FJfgDd
         mBKYL98Hd7zXt2YwbDKL3VefPs0wlKuTYHTuDyV5NbH9z7tvWLD5mraOkkboL9VWsXxB
         XBbm/gm2nJ0QusJ2t56BfkuWdok0lY42jyYuvqVhUQQPUjHrSAlLetIEObCTI41tx8ZW
         NyXXsqsDVQvcFlRShXjKir9r5moFROxR2ayLBd6iNn94saUBcHAenvqbE9BfXM0IYQJ6
         kQAAeI5hXuGUqFyA71KVB8wK2mPCplrK1T9B4ZMADzOFRB6Z4k1VS2mESlDywmXFhjYL
         ooQA==
X-Forwarded-Encrypted: i=1; AJvYcCUTsE5Ir2c3bhkfPfUnSt2huekw4xhtP3jTKpoZj2w8Dmhxl6pnu9emUPy2CPiqB3KIfAx7DaGx1qQUv++laQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxpIiMzxkD7gTx5mM+BDkh5/94MB///JsbQZQHUrUF1xZ70w9Hb
	DENVlRhw5r3qVUvHREdSYdsIHfL4sBULA5tL4z4K90WNokX6Hu36iDg+a+AWIzytuYA=
X-Gm-Gg: ASbGncvmd6j8uRcbKip3WcFfshCXMvX6ENbsX8KyirvzECcmhUHW1PHJgRkCxx+VNER
	SdlyeIGk3AuqLR2vFFBps0CsEZYXw7ZRFZJVps06ZRw4oLXjtfThFO2rCk/1yYjka1rr3GzE474
	X2Z0TGFsvU3kwZMyj4F0kNoY39TCgPrdrbG/iOKu5D0u21lnb4LsqZUW/befG5BvfREgRK/2Ypd
	3Uu2s+ZMVN9jg1GXMXgHRy74I5w6Bmz24BAkQc3234Wr8PpGN5N5Qzr4Yl9PEo8RowSkvbZqvkh
	GxjikdPPszJT7V39JKlSGFVvXrum2ZgEXOI+1b/KsfexhZ8L4ngNwA2jXrfIzZ9Lb9q1GeopMlg
	QrZ2r2A==
X-Google-Smtp-Source: AGHT+IEsZ//+E0/Q5JRbtMOjfmMwrd6ZqBEhvEMcASAfMvO4Z78K40GvJpneVMJGYeJGXSRojLvxIw==
X-Received: by 2002:a17:906:9fc8:b0:ad8:8200:ecfc with SMTP id a640c23a62f3a-ae0578e005amr526516566b.5.1750767765372;
        Tue, 24 Jun 2025 05:22:45 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0b3448efbsm56794966b.177.2025.06.24.05.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 05:22:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 24 Jun 2025 14:22:32 +0200
Subject: [PATCH v3 3/3] iommu: mtk_iommu_v1: Simplify by dropping local
 'mtk_mapping' variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-syscon-phandle-args-iommu-v3-3-1a36487d69b8@linaro.org>
References: <20250624-syscon-phandle-args-iommu-v3-0-1a36487d69b8@linaro.org>
In-Reply-To: <20250624-syscon-phandle-args-iommu-v3-0-1a36487d69b8@linaro.org>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Yong Wu <yong.wu@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1470;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ueipJTTN4GIT99VDYZR+nAvHf+JWom0KrWneDnWo3sI=;
 b=kA0DAAoBwTdm5oaLg9cByyZiAGhamI7Iw+ClTaksgGzVRNZBqEwhCMHErWdDPgl3KBLt2cw5H
 IkCMwQAAQoAHRYhBN3SYig9ERsjO264qME3ZuaGi4PXBQJoWpiOAAoJEME3ZuaGi4PXrSMQAJis
 3J5R/L2EfwRPOX20YInJ3r9Rj4cm59Hk4gwBb6sJBPC42WJRFUfriJKoBwOrXG4/wGCneYOvHGn
 F5h1zJLrIknW/Rr3eQU2JmiXfvfG05b4wEn2q59T4z98TmmqESvXISsSy8InCeK/ui4qCEormFm
 WCluiPBO7+kmKT471cc0V8LUPwBidaXYQy0bvjwLALYhsZSyss5hTi0lqvTpmEOIPjJQPZ8S44U
 y8hpaLmPwJZaSNbSxVJ7jgDmEG0OCU2Lp5Hfk8m76ijVsRAjp7vbifVJJcmzAwVnLwz/Mhp9zqR
 701ZiWueSdJOpFBr9dnum4uzJtbfmdAOcAaZrtr9fZ6/8ODcEjp7a1R4JPWaqzdwTcMrjXDcDSp
 5ucG899MrwqT2WEahy5IreqJFG9SGntaDTDewpOcO1+l+iqe/4TFw1rrvC+vK9qOdHK9DnBc3T2
 6cDBQMuhRGre8ruUf6h1li4CfqdYwi1szocZJHVAsr2PQZvMjWtWLBToNtCdJbPXEhD5loEEwpO
 Fck8zxNaq4AlXafOpg2uWSWvYs13l4VTCztSq9QCYclHzDZhCXukRHSJtPuCdNnQjAO4JtF4LQP
 BdA7mfHdmewfVjvi6I+fwWRhECj2Z5cyuRBK9DFSYqceUX0/iMGPS6nRoDGeG9QYu1NFWb5FYv+
 /WU5W
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_052247_173714_F34109D8 
X-CRM114-Status: GOOD (  11.97  )
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

Storing 'data->mapping' in local variable in
mtk_iommu_v1_probe_finalize() does not make the code easier to read.
Use the 'data->mapping' directly.

ARM64 W=1 builds also complain with:

  mtk_iommu_v1.c:512:28: error: variable 'mtk_mapping' set but not used [-Werror,-Wunused-but-set-variable]

but this is not being fixed here and 'data' still won't be used in such
compile test.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Old warning is changed now to:

  error: variable 'data' set but not used [-Werror,-Wunused-but-set-variable]
---
 drivers/iommu/mtk_iommu_v1.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
index 66824982e05fbfdda224276ad41b90f9d5f9ca4e..bbe3e9d901c69ac6405d9549a4481fc80f1adb80 100644
--- a/drivers/iommu/mtk_iommu_v1.c
+++ b/drivers/iommu/mtk_iommu_v1.c
@@ -509,14 +509,12 @@ static struct iommu_device *mtk_iommu_v1_probe_device(struct device *dev)
 
 static void mtk_iommu_v1_probe_finalize(struct device *dev)
 {
-	struct dma_iommu_mapping *mtk_mapping;
 	struct mtk_iommu_v1_data *data;
 	int err;
 
 	data        = dev_iommu_priv_get(dev);
-	mtk_mapping = data->mapping;
 
-	err = arm_iommu_attach_device(dev, mtk_mapping);
+	err = arm_iommu_attach_device(dev, data->mapping);
 	if (err)
 		dev_err(dev, "Can't create IOMMU mapping - DMA-OPS will not work\n");
 }

-- 
2.48.1


