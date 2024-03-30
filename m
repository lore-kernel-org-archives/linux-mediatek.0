Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17AF3C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 Mar 2024 20:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7VY3Dmu4EorH40eckWnwkm3etCmE+/q9rUNJeyLZY5c=; b=sXW6EHH/JCnxiASTJrrtM4J6KD
	YYKYvd2cPUZxgV1ZlJjdA4w7+paWLTS/ZaoKDb5Nxukc8UjP516UKFPx8mVJe5QFO9L61SbrV+nCP
	meIIOEBNOjXI4NYDrLmbsS7Tj2YynmfU6ZVd8WLtSxSpOG1RMSZpBua1FbSTnqTo/LXjO8rjUAtK3
	72dk2/WEgBoz10Yr5EYik64rFAtBjg8hNI0PiWbRMLpRl9UWPIgNQDHRXnySeLhS457riXlxSZs8J
	U26+D9U1YJm7g9xRpq1wq9yfB4BxlxG0cMoAlbE1SfGp80QTS/wYxzp7H00ZJ0qXe3mfoiC4qK4F+
	KvGpBIQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqfYn-00000004CLe-1oiz;
	Sat, 30 Mar 2024 20:44:17 +0000
Received: from mail-wr1-f52.google.com ([209.85.221.52])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqfYE-00000004BsP-2BeN
	for linux-mediatek@lists.infradead.org;
	Sat, 30 Mar 2024 20:43:44 +0000
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-341cf28e013so1995520f8f.3
        for <linux-mediatek@lists.infradead.org>; Sat, 30 Mar 2024 13:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711831420; x=1712436220; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7VY3Dmu4EorH40eckWnwkm3etCmE+/q9rUNJeyLZY5c=;
        b=wAX4tTTjtyNyXfzxcNSIHlyLI0M7mL4NUQIy7+VzZdJCSPE2l2ocno5Vb8MddhGWA7
         zSYakYYzFlDmYd20SQdYWIvaBQlD5o6B6ocv+TiQcvfErtnCWF2W5kk0xQz763Pp4xpK
         2aSxQ5oErqKd3CPvxQ/IcbNtr2o3dNHuzEAaDyyQHwFOgjMnB6+me3Rvq9Eu/WfebBzZ
         2dU4i/dbX5Dekg3r9Wg1oJvXUK23SpMDi7t9Zze95nm069iSpIak6MY52WyMOYcgHsdl
         7KRU6tuiLDL8PoBL4KfxjThnRHSmsMb9Sy4NRKA9XWdT5wtDz7ZZvDSPbmKsQi/WRGJN
         i6/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711831420; x=1712436220;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7VY3Dmu4EorH40eckWnwkm3etCmE+/q9rUNJeyLZY5c=;
        b=pnd6AxVWOZfosPuOC9J8WyY9L/n1CMseng7JVU2+YvazUUE59C5lFwFJCa+L2T8Q/s
         2J1NuC8MaQnQ29iTVENIi7eHcioCTSILrHnm842TA6qmqSPjpAyFOxYxF6vOwoSsq4Ta
         4sjUr9+/6GjYMfoHVQDUlkvnRSQB8UtVJ296/EoniW2vFddt2lx1NxJG8ut0M4YaPjr7
         yi91YtPUHkmxwpfo3Ewkdp90gGwG5TUqDn6MxHy/zJujbVURV8ZIEy1SKwQtueQgd+yx
         +Rz7Dvl7QtGYjy722I0LypqthFyO7ILRX+cTvR7iQrszLzbNV8up0E7jd//rJEVsvtbc
         PYyg==
X-Forwarded-Encrypted: i=1; AJvYcCV5YddkBMdbqeaWT2wW/87sucUQGrc+624HBE0TyjrGYRad/BH3nGfrtjUZdTqKkeaAtXeZ4WjQaGp9UIYhvzuPMtny7dXsznJHHNqBI9AQ67pY
X-Gm-Message-State: AOJu0Yx3WIFPAc7C1KI2swWSzi4oHgxOc3XxdD5bDip++lAFx74H7ku0
	scxJawNyHTsvubulN/ythWj08JEbZExhfLgkWsOIC05KKeXBpk+KmuPMcaWI5rU=
X-Google-Smtp-Source: AGHT+IFbOCs9TFu+n2kbIFtRw36Yy/n4grYGsiHavju/CpmA97FWAH4OFTc4Ow13LOgAlK4kyeKMcQ==
X-Received: by 2002:adf:a38b:0:b0:343:30a2:3a3d with SMTP id l11-20020adfa38b000000b0034330a23a3dmr3563635wrb.62.1711831419771;
        Sat, 30 Mar 2024 13:43:39 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id o12-20020a5d4a8c000000b0033e7b05edf3sm7231299wrq.44.2024.03.30.13.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Mar 2024 13:43:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 30 Mar 2024 21:43:19 +0100
Subject: [PATCH 08/11] drm/mediatek: rdma: drop driver owner initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240330-b4-module-owner-drm-mediatek-v1-8-fd5c4b8d633e@linaro.org>
References: <20240330-b4-module-owner-drm-mediatek-v1-0-fd5c4b8d633e@linaro.org>
In-Reply-To: <20240330-b4-module-owner-drm-mediatek-v1-0-fd5c4b8d633e@linaro.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=848;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=uAy7H4eGCdk2E7sc7F+qp9jeOr5X36oynpik4Iml/WI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCHlrb77pr3hI7+1RouTIhAWQ+29VPx2IGr5m0
 aF4RIu/KVOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgh5awAKCRDBN2bmhouD
 1yUMEACHHdY0DRk43LPsx8K5J8nDnUK18mFIQbvuGtiJzvZikxyF3zwRok38O2UNaH5BC8WnRL9
 SknXjkKjO47v/ExyECq7PZCAlGbVP1UUOGZPOmLwqprakytYugm/F8warYH7pyWbJlpyL6LMKb9
 /7xmg/t2T7chRpKnRpchAm/6nmdpeInomU/50jeYZOSz5GHq0jQA3a94tyyOoojAXTpWGxhtpSJ
 LAqhvP33/QUq7MMfF2fbdorclE3UW7iUM/gmzGrUnQsrnl5SmBzGsspbn18ewr54P4a/UdyyTm/
 q1w4UxOuC27FK9XMWFNjt3m/gRfTfEA69wJlVIqa8Ea7xjQeGkt3YBw8M2wg44Om97ykwxhCeRv
 CkNA/cTN/sMne1Et/eyRcUgT+nxHgVSgEMjQwYWHd8Jqxzu3G8P/oW1ZADpufAeMJg+aW0oqh/Q
 FBmIDXT2H6rCIR5w4SYctLhfgUp8C8AiTCUYlCxvZaQZY/QU7znvAbdRXQvafwNfzCkZ8fAQEP+
 sAbxYfedxBQ4IPQTuaRa0/efLUFzBkkftsZOXfC01j8UqCg1N7DN7Es8A+TOsEasn83a5pqHTOG
 FgNcwKOb7b7dJqQopW9HrzSoDWRDhAf8RT8t+OQnWbEOGoYwQa2pBMMhNQKCBq+aFrD1c6Lg/xW
 1XF3oPaEZT3NTlA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240330_134342_605823_32BEC1BE 
X-CRM114-Status: GOOD (  10.48  )
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

Core in platform_driver_register() already sets the .owner, so driver
does not need to.  Whatever is set here will be anyway overwritten by
main driver calling platform_driver_register().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
index faa907f2f443..844f5c2b56b6 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
@@ -428,7 +428,6 @@ struct platform_driver mtk_disp_rdma_driver = {
 	.remove_new	= mtk_disp_rdma_remove,
 	.driver		= {
 		.name	= "mediatek-disp-rdma",
-		.owner	= THIS_MODULE,
 		.of_match_table = mtk_disp_rdma_driver_dt_match,
 	},
 };

-- 
2.34.1


