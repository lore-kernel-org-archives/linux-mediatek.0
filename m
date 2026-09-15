Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D09C88E75
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2026 09:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=96B/n0qyp7z+ICJfhqaTshDbMoTzd8gumlBOo7qhHZw=; b=sCnQW9MvHk2arRCOjxZSgh1Dt7
	fwWL6oANtboGuNaMmQ7ULKyj7mbQK2Cty7M4cp/SeH8e6dG37kX7NVe9B4MzdaAlBfguNkUaNLh02
	pDGI+vdyoDtXvkOmNWzXct62iX/sVTKKU2+2AxqyjXpjwX+Ig3xs+sDQ3zQwSi7hMxQd/Vr0z58pZ
	WIo6iJOTVFDN16vu6rumbKcXgVbLn+06S/0qPU52BVDTDvOOGmjLF+A0wsFcLOmNNdCfF01xOBOKd
	icP6oIzKDeJj3HdkC6+Tkw0A6xGMHE8kmj6Fh9uFvb49qFttiDxRtQ3jM2ngCQak8Z/Zn5EqPwfiT
	LLp+E5gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6P4E-00000005ir1-1hSg;
	Tue, 15 Sep 2026 09:03:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6P4C-00000005imY-18SH
	for linux-mediatek@bombadil.infradead.org;
	Tue, 15 Sep 2026 09:03:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=96B/n0qyp7z+ICJfhqaTshDbMoTzd8gumlBOo7qhHZw=; b=IC9XkApbIlHR9o36pwKmKOnLAN
	O6cYwXNqMVi/BnmhP0dAYu4HX/bljylj+1wAADEApRdRTnPLSPs3vZMkjBGuHNyTtlEnVJtaRCakf
	iT2q04500FPXzFfCmDzZt6Flz1n0Rf4HFmXlzkcXL7R4CqGb3gylN8ojLcpuZN7cYpaGfWZ+YhPlB
	8+rZ3l4KnicP6Egs0+5KG4jow2UBHuLe0oHZhET5/Ko+kLlUh5D1xjnj33QWHh2UXTm/h47rVw2lT
	hi56+b5UceqKqhd75Osx6+fvBead4EHg/WLo8DqcPC9pT71TXpaUT98oGHjsfySohPdhbqiTeLGL8
	zvEhFOCA==;
Received: from mail-ej2-x10.google.com ([2a00:1450:4864:34::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6P46-00000006TEd-0JYf
	for linux-mediatek@lists.infradead.org;
	Tue, 15 Sep 2026 09:03:02 +0000
Received: by mail-ej2-x10.google.com with SMTP id a640c23a62f3a-c254fa663c1so398293566b.0
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Sep 2026 02:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789462977; x=1790067777; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=96B/n0qyp7z+ICJfhqaTshDbMoTzd8gumlBOo7qhHZw=;
        b=HO1pi73jCeCJaioMkRNLho8c+AwjVfSEpgSjKdG5iXJg6C29G0JBkSvrc/DVYhtqcz
         Iy+7s30CARpTBu0hC7JlAw2D0u4SD8FLYj6nDsX1TyWcQgmBq1TvbQO53bF8oZP9NKSE
         pa3m/0Sz726rKv3UbaosHirPJ+eGzXxU+BqfvNt8XWEp0dPbt/jDlcAVh50lZ7oZO1aB
         IBpeOG0nfyWJZkuWjB5ZI47gcXQiz86FuVeIu9x8A0xQ17aelCjAM1NINO4w5wSxuQNj
         r/CXVyasKSXciWjeCfNmaCfOKDlqTmC569zZWqzCcOkATF0EnUVMnRA4EJlpjIYRugcB
         LkAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789462977; x=1790067777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=96B/n0qyp7z+ICJfhqaTshDbMoTzd8gumlBOo7qhHZw=;
        b=TgDdY135/TlIBuCLkLGXUVP6fTmnTFom7XhzhRexWUP1GQhsCpJ+Kf6ibVJ+yl0MSH
         w33Wzl/0u5F2lea1zNA1XZCnCUUwjU4UKkjl1Q+NFEYdGrR/Nex13FMLcqsCDJzOQEVR
         KJrLzBFH4sK6T4aTvGSAJPEpAzPNxPLdLfUxhxrrnSa6Ql38MRji5wi4KNWekYuTfBcm
         6oLI8A4tVlTc5W6Bw7jNwos2qLkTQZ6yBVXsPAuV1XwFJzPedlBI80a1pMmS567/gcZx
         tsEjb2EOIei6QzxcZSCERNvw+rnbmElC0yvqzD2+cO9HvAmR0UOh+zcfN8ninc460H3C
         LZwA==
X-Forwarded-Encrypted: i=1; AKwUvBy+olxmJCp2ecV79uJHIxmBSoPe24tlgvosVGR2jFBoRPoheWusb0sBUQOTYNU/ZewUX33U+SUFZVFuT4/qSA==@lists.infradead.org
X-Gm-Message-State: AFuF++lsiPr198OlSt0OwOkF9GpbzEGW0eCVSQ67XSOQy36BdUt35SBp
	4TUaBQBdZSWsi15Afm21mAy0oq3yrUdYVrpmZeyVcZjKZyewNEbr1njk
X-Gm-Gg: AYBFou03tcbucu1CMIM3iqvc2DwGM1Bb+Js9t2CysCyWyJAkItwO7Wq+5zwXD1JIPtG
	9AljXYls0KNQNDEu0cFU4r2bjKF2E0uejvVle3+zJzR1tjK2IIZRlxUYBLrXYa72ZwntRLiPqOv
	YKYcGDdjaf6zDho3nkFkYG0woNoqDL/OtHInPFghFx8ZTFuQ9/rmMcql7I0/BndwxBadUTXnZic
	k3c2pzShO038qzzt+IupjaQxprEnP1nsdDB831QQmfr+FqWJrFBYwHZx1dMZF8C9HuXhWJwQ/7j
	K73HYvQjTN7txn6SDgf+78Ddl7sk65arrgXwOzcfJ4+nF/bR8iQUziwYfkgk96j2mnQQK00UOuO
	ySCgjGBlfdLez+Iv6wvoCbdOtdP4LHnkYsEQYSqbXQwBeiZifqLxTnaXAwoJjMH4zoEyPlVblnU
	9x7OK7x2HTCvVC4Pxwa5OHnOi30+yx8Vjbb/eZD2XWke779tqZkf+aWALoea7GLlmGFOSg5ofW3
	tVD3TkLashYUEbRWabcblvLMKYH8UCpb51q0n4yzI+9KuU+vT/yFmGcxqCcSUM8uJmEGjLEOTY3
	4h6cBhdVfSF6KdBn6pAMqaMNrLyyHQ8H3tczh3DD970L1ggpDg76MdeA/MQeldcMbqPqAeBhFJC
	yGmqODneMOclNyDmC7nnDntPjNs/Ttx93zYIvvvO1NwE3erKgYpjR6JLI9n7B34ilsWFRTp3npj
	3ir8p4Vw3Po6XBz/wmde4WByO8mI54Es7bTpHPFS4reAiUTC/nZb7cjeAlZXi6DxbHwZtlsl4Ot
	JqYfEVZvSE=
X-Received: by 2002:a17:906:7309:b0:c25:47a4:fedc with SMTP id a640c23a62f3a-c29b839a057mr853572666b.2.1789462976636;
        Tue, 15 Sep 2026 02:02:56 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-b.c.oa7bb030819b2a894-tp.internal (88.71.12.34.bc.googleusercontent.com. [34.12.71.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4cf01sm546369266b.1.2026.09.15.02.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:02:56 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH 3/6] usb: xhci: add missing pm_runtime_dont_use_autosuspend() calls
Date: Tue, 15 Sep 2026 09:02:20 +0000
Message-ID: <20260915090223.1346-4-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915090223.1346-1-joshua.crofts1@gmail.com>
References: <20260915090223.1346-1-joshua.crofts1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_100259_751506_7524CEBC 
X-CRM114-Status: UNSURE (   9.77  )
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

The disable_runtime label in xhci_plat_probe() and xhci_plat_remove() both
call pm_runtime_disable() on error or device teardown, but don't call
pm_runtime_dont_use_autosuspend(), causing resource leaks.

Add the missing pm_runtime_dont_use_autosuspend().

Found using Coccinelle.

Fixes: b0c69b4bace3 ("usb: host: plat: Enable xHCI plat runtime PM")
Cc: <stable@vger.kernel.org>
Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
 drivers/usb/host/xhci-plat.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 6fd595f81a30..29e743d6868e 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -388,6 +388,7 @@ int xhci_plat_probe(struct platform_device *pdev, struct device *sysdev, const s
 disable_runtime:
 	pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
 
 	return ret;
 }
@@ -461,6 +462,7 @@ void xhci_plat_remove(struct platform_device *dev)
 	usb_put_hcd(hcd);
 
 	pm_runtime_disable(&dev->dev);
+	pm_runtime_dont_use_autosuspend(&dev->dev);
 	pm_runtime_put_noidle(&dev->dev);
 	pm_runtime_set_suspended(&dev->dev);
 }
-- 
2.47.3


