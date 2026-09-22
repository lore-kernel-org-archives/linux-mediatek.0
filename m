Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A14D7C982E6
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2026 00:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+px+gyXVLidkcy+k/uZ//IG8TqK3wgfrhlr6nss3oOM=; b=UQ94mMfBIWbkoNNnK6i/lZ/CNC
	i8ixfBptt/XCxJ1O9zxgITIN+rq4gnWQICg0MkiorrFm3xZywlQ5WmGiXll/DDN6U/hHPNl2m7p/a
	dTbLDGxg1unUNPnzvZwPVxf/HnpR/0VII57eX+3tzRo+ui6Ph/LZKuwyXelNaWikflx3PAFzM8FEk
	aBCgU/Dtw9z8bSMxX9nJ+MUFj/GyuE8Lh2cN33H5RdaqukfEKHz4xYUkLoP69sYhpbWNy55BkGPy7
	H5BSyDY6cXqDEnl25PpgI4NMIK6dGQtdK7H13qjy8DMrKQcf7MhOTK3dYFbrLfIHFm0grUYe6Ncks
	fWTDttCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8o4d-00000003lFo-07Ca;
	Tue, 22 Sep 2026 00:09:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8o4a-00000003lFd-45R1
	for linux-mediatek@bombadil.infradead.org;
	Tue, 22 Sep 2026 00:09:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=+px+gyXVLidkcy+k/uZ//IG8TqK3wgfrhlr6nss3oOM=; b=ovxmVZ7kJCXZV0LKBHSzN9JlUv
	fJPZeuE/CwpBCUR3oqBDFd6XJCD7xfDEw+VEByiPYcR+CJ/KieFLSrtiYWvt6OiCEcDNa3qW0ZRD6
	ErQ6YfGY2yJNwsnrYFLMMCqFqs/2CH+FTX1tw+D+FU4tlREsjaK7B+DY10sRuB3rU8xHfRNCnqh4P
	nhv+Zex5nJKuON/CyPOq83s3SXBicUytWKYjE3cbJ3lmF3+eTm1bxw3rlyBsNg5fXEjmkQbqyP9NU
	1z8VJA50mrhf3f0z0SrXVjKrNfOeIGW328CKTa9ICl9D6F1nXowTi5xMkAtGjdnUovpz+mxU6jcHY
	lShSTAsg==;
Received: from mail-qk2-x10.google.com ([2607:f8b0:4864:34::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8o4X-0000000Cw7V-35fq
	for linux-mediatek@lists.infradead.org;
	Tue, 22 Sep 2026 00:09:23 +0000
Received: by mail-qk2-x10.google.com with SMTP id af79cd13be357-93910a0cefaso311202085a.2
        for <linux-mediatek@lists.infradead.org>; Mon, 21 Sep 2026 17:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790035759; x=1790640559; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+px+gyXVLidkcy+k/uZ//IG8TqK3wgfrhlr6nss3oOM=;
        b=Jpj4iPo0hQCInYpENn23itykyx42+B8LHumtRYLVR9h1WPZyfJPCF1QLDtxIXJGipE
         6mD+izhnWyB6hAypOJgJxUcjTvXyVpqGt6La+jWwwHKS11XHLlwgEvKfs23Lu99skPkZ
         YinhMZNpncPYI/2iTqm5wBTQ9RiypzTR/InhNdBjaTVwgwiaK7i4wRPwKXvmNr6ctTBD
         3R1NlNj7odx03AirqwJvU6j2kDoTxaJ0uVxTd9JZ0T8mstkXKIuzfSDHSV9eHIlMTt0T
         BZ6j22HOHyNuk3WGPAH44n7QI/AZULVwTpVNnKhhErPH65ijn7d2TIzF07PAm4ElWgMR
         8QkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790035759; x=1790640559;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+px+gyXVLidkcy+k/uZ//IG8TqK3wgfrhlr6nss3oOM=;
        b=kwSmlxsHg0XN6xGnU7EgYSMpRWKIT5aAgotAPsJI67fsTpA9heeW9AeK9TIDocw4gH
         79PAnhWU6ftvZQU7ybghD6SUpm0VqH2/O4/BPHt1v42EvQbKVZvTBjavh2RVnZgorDtQ
         N3nbZkn/CMZ/1fzpWLPm1zzFFZzGQU79rXsLsvnYfkcO1FbmGPqg9TGDZZqJv64Su+6b
         0YeFpmlMqavZBSZbZEy2fcNcedG1BjPr+sR8lTpoQ6cVEGHvDeC2TIGxK4Fja7Dsjq8U
         HCxX0HZWLrxCccRZ8uKTPuPs/D30pj1xpiAeofAAQeWD7Y6pQsYJMMD76KXRacZLSgSQ
         5scg==
X-Forwarded-Encrypted: i=1; AKwUvByZphAzD0ZJ1/+2D45HJWhHxvXvJyXs9uhyaPtmak1i3m4VM3NAylud42b7EKVo0kOBgpHLcdy+PxrWfhM3XQ==@lists.infradead.org
X-Gm-Message-State: AFuF++lCIbwBSWjOMZ+gNveK1bo4GNl/CcrvPBbKLnpDBdIj3RmAE6qF
	66JTHpcxRCX3gpqVjNU+QnG3xvBMQlLLOGrouZMZfWrbMiP0VfzUBkw=
X-Gm-Gg: AYBFou1xQgRAg2QTVNnrwLf6NxPXUIMkdvn8hFcX5AcxEyoWTqsfRnsJiBNkp02D2aS
	HUp2R1Z70Yjzd41xJlHMqAbT+MF5wNBA5phbsVBytJqpoZ7D7EJsRFJaO13tc56oyjp5a+yKRS2
	pb8LqqVl7LmdrdkxwI5jhZ6WKQaRVW9ncjbXWOZ+RNCd+7vFNRWiIjxWPvBcrU26+/z2lbVn5S3
	RzaEF4R1pYOYBZFHOpNZ4FiFfqNMnzBKeSpcVwslEmg+KCUuICMdsbmHfim6lcyt8xnRpArLTI9
	IQGY6Xh79N16LIdyucNHpAL3mN7i5ATURv4L7vaF+z1LTxVJoJa+7sMcFzfE8sUphv5tmUo1vB2
	JKQ1R+ZDFwUc2T42W3ui80EpjxANiFYjT3XXw4iURp48bf8gkuOgEzSKrZvouR5FDb4AruCP3Wf
	B/X/L48IPvVfT7Hxb5Mhjk438tuE/fGBFPwSmmpDFNs89x6edu2SIuT5+SX5zeWBngzgGQBk0hz
	yh5pONX2UMuJndDzmaJQIvFQAtuoPtw474l++rgddTWcs+svuv4JOaFkjpDjSroWl24DSUgQ/QL
	8Sci2DEIdB/G+ahpkNOaeBJCyGzX
X-Received: by 2002:a05:620a:1791:b0:93b:f246:bae8 with SMTP id af79cd13be357-93c15e78ed6mr305051085a.37.1790035759325;
        Mon, 21 Sep 2026 17:09:19 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c19a812d4sm53263785a.22.2026.09.21.17.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 17:09:18 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Myeonghun Pak <mhun512@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH net] net: airoha: npu: cancel wdt_work after releasing the WDT IRQ
Date: Mon, 21 Sep 2026 20:09:14 -0400
Message-ID: <20260922000914.542068-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_010921_956977_835F9F24 
X-CRM114-Status: GOOD (  16.01  )
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

airoha_npu_remove() calls cancel_work_sync() on each core's wdt_work,
but the watchdog IRQ that queues it is requested with devm_request_irq()
and is freed only after .remove() returns.  airoha_npu_wdt_handler() can
therefore schedule_work() again once the cancel has returned.  struct
airoha_npu, which contains the work, is devm_kzalloc()'d and is freed in
that same unwind, so the late work dereferences freed memory.

Register the work with devm_work_autocancel() before devm_request_irq()
and drop .remove().  Devres runs in reverse order, so the IRQ is freed
before cancel_work_sync(), including when probe fails.  A cancel left in
.remove() cannot get that order.  Initializing the work first also stops
a pending watchdog interrupt from queuing an uninitialized work item.
Probe currently calls INIT_WORK() only after devm_request_irq().

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: 23290c7bc190 ("net: airoha: Introduce Airoha NPU support")
Cc: stable@vger.kernel.org # 6.15+
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_npu.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
index 5bb4817a898d..4d3195eb00f7 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.c
+++ b/drivers/net/ethernet/airoha/airoha_npu.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/devcoredump.h>
+#include <linux/devm-helpers.h>
 #include <linux/firmware.h>
 #include <linux/platform_device.h>
 #include <linux/of_net.h>
@@ -751,12 +752,15 @@ static int airoha_npu_probe(struct platform_device *pdev)
 		if (irq < 0)
 			return irq;
 
+		err = devm_work_autocancel(dev, &core->wdt_work,
+					   airoha_npu_wdt_work);
+		if (err)
+			return err;
+
 		err = devm_request_irq(dev, irq, airoha_npu_wdt_handler,
 				       IRQF_SHARED, "airoha-npu-wdt", core);
 		if (err)
 			return err;
-
-		INIT_WORK(&core->wdt_work, airoha_npu_wdt_work);
 	}
 
 	/* wlan IRQ lines */
@@ -803,18 +807,8 @@ static int airoha_npu_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static void airoha_npu_remove(struct platform_device *pdev)
-{
-	struct airoha_npu *npu = platform_get_drvdata(pdev);
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(npu->cores); i++)
-		cancel_work_sync(&npu->cores[i].wdt_work);
-}
-
 static struct platform_driver airoha_npu_driver = {
 	.probe = airoha_npu_probe,
-	.remove = airoha_npu_remove,
 	.driver = {
 		.name = "airoha-npu",
 		.of_match_table = of_airoha_npu_match,

base-commit: 238650ef6c7c7cca08e032527329424c9fbd70e5
-- 
2.53.0

