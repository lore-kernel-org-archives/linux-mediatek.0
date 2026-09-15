Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52EAEC88E73
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2026 09:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qexTWbdmW8eEb6vSlsUiXVjBfkjIzpmrkaoJ6YlOyks=; b=qo1xx7+IzlFvzqZGIt+edGCHZS
	zLJ7SnfarIvM53t2l1mrRzacN5qFQwNKMmCBe8eTJzXdzsFPpHDfA7XW1LA/z1H3aRHa5sERQawUK
	3OEO7MCsht0JqUJQf7CzIU2Sx1E2cgfI0Ibsd7ZXIwg9qDc8ndb1MZXB3CVqccZyA9HguP6wLVTsM
	R0H8HVA1PHG55bCxOjIIj58hmB3qJDV5ohDGIk5kZ+fIliLPF80g+6/0qS3TYF42XunYkdx6KWCc/
	zFJlwke5lJU8nVeXRgQjp6GlQrl4+jG1qLzR/K8g3eTfZ5q9Xbb9AwRaQ8CMEs2VXlvtjW9FLRvbf
	KEPeQggg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6P4A-00000005ilP-0xig;
	Tue, 15 Sep 2026 09:03:02 +0000
Received: from mail-ej2-x10.google.com ([2a00:1450:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6P47-00000005iiE-1T7O
	for linux-mediatek@lists.infradead.org;
	Tue, 15 Sep 2026 09:03:00 +0000
Received: by mail-ej2-x10.google.com with SMTP id a640c23a62f3a-c254f55eff0so372085066b.0
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Sep 2026 02:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789462978; x=1790067778; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qexTWbdmW8eEb6vSlsUiXVjBfkjIzpmrkaoJ6YlOyks=;
        b=JLDljCSX8KaPGmhZynIxavubkD45c/ZjaTHYQHqBm8mEFl49VgFErfhcXN5ZHZlGqf
         Kqm0FURw87RzxmeaDXV29rr+K3GiUt7UEPIOlNKGVcXf1yhv9Wbi041DhFLlleVzblfw
         XyMdviDik3hyZ6o2N5p6tUdFsDBG+/JvLOBXvrWfdBbgdK0SSfZu8JvIFIV2+I2Kzw/a
         HX7gmwpu/WFTt5Xm993IdSTixxODTMKjM6KKhpkmSMtzCkSSrCrxMbkbGFR45E+Zq3DT
         B2l7Bx6UgEFEtmgZllrprZ82VtlZG81d/eqSQN6p3dJ4erICMMPKe/9iZ1LE4ONQ6cQb
         5gHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789462978; x=1790067778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qexTWbdmW8eEb6vSlsUiXVjBfkjIzpmrkaoJ6YlOyks=;
        b=GbsXTGpdTaipSqP9V4EEMI7G+kQg+6kK1rIJusLitNJ6xfoytbtlSR496e71v9PnrM
         fH8KByRglgxlvuVszPlLhH9wbMWqb+Xugz3mXBNjcI9Dcf4P7wFxV+zgt0i1RXoHcp+d
         9wfn9o/+oxuDaldMkkr69hJa6sqgXToN7svI4qiF4kGn+YTlqWWuoKseYVIAm+CzsD0z
         9btI9VNwWndpjsjPexsIiw0Z5fjds2ra2SAq8ghdJBokO8qtWRJDPVDAutVbqr+EYCb+
         6lwnyCo/+AqkhH5AZnmQnTGq26pSBp3OlIcT+7zczEgkg3omwxILForFopy/gZlTJ8CT
         HyYw==
X-Forwarded-Encrypted: i=1; AKwUvBz+T7dKotMqVpTFgQRuLxCzkID8sNvkbAWN9SOnbAP+55PgiycAPbUccnz2p5InKbx/WA8Ap2AuRHsB/0QHbA==@lists.infradead.org
X-Gm-Message-State: AFuF++n+xFIzrfbFZw4uhKJDg2KxriCGxV8rIomnF/nFngXf/MLBRimf
	X/l84y1KuWLF/DVGsoAjmHW1aTHYVbvXnjurGD0uzsYr9aNP3rYUEokI
X-Gm-Gg: AYBFou1ELK6EQ/Hr8GoIFTnvT1POSeymz5Ih2AgPkeFGZc26MKw32RN4UCAphsC6PKw
	YimdZMhVPFKcZ8bNsQNWeejJQiQbpj9zPrzRQHwUeYTAMlXoplFfwhNTXp8+ii33HnU7RZyVl7c
	7HOcSQZ6gBvLVM1l6m/aq85M54iE3Ecb//wRQUlXnC0oepcr6RqdwNT36QLHVGeAqAmkmlSEuTO
	IEmpnZrz5+3MB1p/EpmtngihhjB50D8PQtbk6Q8kTmM3PlPcdZ699oIa8+arfPqo7/KbdMFGMPy
	fdRLwjEA7SSY9UPq0n1MLOqtDQ6PecfZkVZqoxJXARw2wzdYO0mWim+l4f/I1iAs6gRQ8WxFzlv
	0tOeo+XnMJbS8sEIkukCLBMX4UbyfRuZM56Julp19DR0SKaiRPGS/x2Mg4eDeN+owiWHBhNT4iy
	LLVjD0hKZlmNnCBi80cilbdbXVH0HJIBRJ+hSLDkGabptyw8NW3faR1Q3W+PsIxzL6YTfsWqZvF
	8zzaSmfyHTD91rjO1i3cMVAuDP5qmk9S3aoRTs7fYhAybMMqk90d+KGDHssW1FIUaERuOTc/kFm
	yekGZ52PFjiv25JXf+VGr+/pGwTTnWEv7QawplyJ6ImJUpUFRlFvyqP19ZuPGwPlfn/8o8uMync
	u73pNaMocKMlMBKAdBQMea38WJ65b1FRQZ4oTBiaJ2l4iZPbGKMPWPbsPCavj2FPm7WL11WOP5j
	jLuq2XZxgcloRu3f/k3pQgsJg8G0O7dKN/JNtdAI8MZOfGzfa7yNBTUj0D+4DKFELTM1lC7/quA
	kwLcWrbfTo=
X-Received: by 2002:a17:906:f597:b0:c19:45e3:2f57 with SMTP id a640c23a62f3a-c29b84c7106mr395967466b.9.1789462977606;
        Tue, 15 Sep 2026 02:02:57 -0700 (PDT)
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
Subject: [PATCH 4/6] usb: typec: ucsi: ccg: add missing pm_runtime_dont_use_autosuspend() call
Date: Tue, 15 Sep 2026 09:02:21 +0000
Message-ID: <20260915090223.1346-5-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915090223.1346-1-joshua.crofts1@gmail.com>
References: <20260915090223.1346-1-joshua.crofts1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_020259_453230_7971B73E 
X-CRM114-Status: UNSURE (   9.08  )
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

ucsi_ccg_remove() disables PM runtime on teardown, but doesn't call
pm_runtime_dont_use_autosuspend(), causing resource leaks.

Add the missing pm_runtime_dont_use_autosuspend() call.

Found using Coccinelle.

Fixes: a94ecde41f7e ("usb: typec: ucsi: ccg: enable runtime pm support")
Cc: <stable@vger.kernel.org>
Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
 drivers/usb/typec/ucsi/ucsi_ccg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index 91c2958a708c..9d3ebb255de7 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -1519,6 +1519,7 @@ static void ucsi_ccg_remove(struct i2c_client *client)
 
 	cancel_work_sync(&uc->pm_work);
 	cancel_work_sync(&uc->work);
+	pm_runtime_dont_use_autosuspend(uc->dev);
 	pm_runtime_disable(uc->dev);
 	ucsi_unregister(uc->ucsi);
 	free_irq(uc->irq, uc);
-- 
2.47.3


