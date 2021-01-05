Return-Path: <SRS0=qO9d=GI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B057FC433DB
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 00:59:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A7C922AB9
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 00:59:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A7C922AB9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=47LqfpKLPkX83wOYk9+NvbV7TKdn33y3xOg1AVhPZ+8=; b=rFvAYLlJA2lkxCuCKIGKtLgpd
	xMB/e/I0JuIimA0G9YyuSooCk4N/nXuy9T1diAFa1+P/iuTBdYA1Y0vtYRpfyaZIKGvcTRFLhAm4D
	9SRuXJlXCxCDhGVUihJAQuQzwvjzziziEJgdvoys/k8JSr54ocLjKQuzNH8tzoR7LINgGvs0oOoX3
	HLq7+2C+MjBHdkRWiBDl+FpSNp5mt7cbRUuC0Z+nIwRFSFym0HWs5Mg/qtFYlfwBWg1sikenlrnbh
	R4l41vVGVS98oimpQCqy5A9ViMoy0/6YZgVFK1n90AbYPp71R9FRMfYJsb33XNTFA1zJvEcyH5jQL
	5f5J4HNwg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwahM-0005Gv-0M; Tue, 05 Jan 2021 00:59:44 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwahC-0005D0-Kd; Tue, 05 Jan 2021 00:59:36 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 45C44227BF;
 Tue,  5 Jan 2021 00:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609808374;
 bh=xoTRx8qQQtnSaYwMqIVpCPfEi1lceBrcYZvQ/URSaLI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=V9peiXeIha9VfViLyQJFfB3EFce9k7DJrJsEblihmZkUSc/9aVkc9yd1JW/8ew8OY
 Qe/qlUjhHeKQqDqWtCXI+KMvOwXwQYSMJUbubzk4nTZNoozEwC/4AxQHpWAjmDRNic
 BvhKLH48W9WTvVGdkG/SsqOefaZ/xCIAaVo8ZRNoKMGwB2bRInt2tyc0lptFkvPIeF
 V72Rs7y3XCLdEzHakmcftu5cikH+LZZeMb+/2bhpebkbX3GJ+NjB9HajQ5utpt1Ey4
 8sX6W7zEbvp/8zxNMXn/+EzKpoeUbe12HPOrMkvrnfYFRelZGooRXZETgqFQtl2mYo
 ZsEiqJcKtPJMQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 11/17] scsi: scsi_transport_spi: Set RQF_PM for
 domain validation commands
Date: Mon,  4 Jan 2021 19:59:09 -0500
Message-Id: <20210105005915.3954208-11-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210105005915.3954208-1-sashal@kernel.org>
References: <20210105005915.3954208-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_195934_846124_DD9536DC 
X-CRM114-Status: GOOD (  15.76  )
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
Cc: Jens Axboe <axboe@kernel.dk>, Sasha Levin <sashal@kernel.org>,
 Bart Van Assche <bvanassche@acm.org>, Stan Johnson <userm57@yahoo.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, linux-scsi@vger.kernel.org,
 Woody Suwalski <terraluna977@gmail.com>, Ming Lei <ming.lei@redhat.com>,
 James Bottomley <James.Bottomley@HansenPartnership.com>,
 Can Guo <cang@codeaurora.org>, Alan Stern <stern@rowland.harvard.edu>,
 Hannes Reinecke <hare@suse.de>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 linux-mediatek@lists.infradead.org, Stanley Chu <stanley.chu@mediatek.com>,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Bart Van Assche <bvanassche@acm.org>

[ Upstream commit cfefd9f8240a7b9fdd96fcd54cb029870b6d8d88 ]

Disable runtime power management during domain validation. Since a later
patch removes RQF_PREEMPT, set RQF_PM for domain validation commands such
that these are executed in the quiesced SCSI device state.

Link: https://lore.kernel.org/r/20201209052951.16136-6-bvanassche@acm.org
Cc: Alan Stern <stern@rowland.harvard.edu>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Woody Suwalski <terraluna977@gmail.com>
Cc: Can Guo <cang@codeaurora.org>
Cc: Stanley Chu <stanley.chu@mediatek.com>
Cc: Ming Lei <ming.lei@redhat.com>
Cc: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Cc: Stan Johnson <userm57@yahoo.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Jens Axboe <axboe@kernel.dk>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/scsi/scsi_transport_spi.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/scsi/scsi_transport_spi.c b/drivers/scsi/scsi_transport_spi.c
index f3d5b1bbd5aa7..c37dd15d16d24 100644
--- a/drivers/scsi/scsi_transport_spi.c
+++ b/drivers/scsi/scsi_transport_spi.c
@@ -117,12 +117,16 @@ static int spi_execute(struct scsi_device *sdev, const void *cmd,
 		sshdr = &sshdr_tmp;
 
 	for(i = 0; i < DV_RETRIES; i++) {
+		/*
+		 * The purpose of the RQF_PM flag below is to bypass the
+		 * SDEV_QUIESCE state.
+		 */
 		result = scsi_execute(sdev, cmd, dir, buffer, bufflen, sense,
 				      sshdr, DV_TIMEOUT, /* retries */ 1,
 				      REQ_FAILFAST_DEV |
 				      REQ_FAILFAST_TRANSPORT |
 				      REQ_FAILFAST_DRIVER,
-				      0, NULL);
+				      RQF_PM, NULL);
 		if (driver_byte(result) != DRIVER_SENSE ||
 		    sshdr->sense_key != UNIT_ATTENTION)
 			break;
@@ -1005,23 +1009,26 @@ spi_dv_device(struct scsi_device *sdev)
 	 */
 	lock_system_sleep();
 
+	if (scsi_autopm_get_device(sdev))
+		goto unlock_system_sleep;
+
 	if (unlikely(spi_dv_in_progress(starget)))
-		goto unlock;
+		goto put_autopm;
 
 	if (unlikely(scsi_device_get(sdev)))
-		goto unlock;
+		goto put_autopm;
 
 	spi_dv_in_progress(starget) = 1;
 
 	buffer = kzalloc(len, GFP_KERNEL);
 
 	if (unlikely(!buffer))
-		goto out_put;
+		goto put_sdev;
 
 	/* We need to verify that the actual device will quiesce; the
 	 * later target quiesce is just a nice to have */
 	if (unlikely(scsi_device_quiesce(sdev)))
-		goto out_free;
+		goto free_buffer;
 
 	scsi_target_quiesce(starget);
 
@@ -1041,12 +1048,16 @@ spi_dv_device(struct scsi_device *sdev)
 
 	spi_initial_dv(starget) = 1;
 
- out_free:
+free_buffer:
 	kfree(buffer);
- out_put:
+
+put_sdev:
 	spi_dv_in_progress(starget) = 0;
 	scsi_device_put(sdev);
-unlock:
+put_autopm:
+	scsi_autopm_put_device(sdev);
+
+unlock_system_sleep:
 	unlock_system_sleep();
 }
 EXPORT_SYMBOL(spi_dv_device);
-- 
2.27.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
