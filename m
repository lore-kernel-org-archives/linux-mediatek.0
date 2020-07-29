Return-Path: <SRS0=1w4W=BI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94C04C433E1
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 07:44:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64B5E20838
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 07:44:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UyKVjEu7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dph5wHjH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64B5E20838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lFrtna/pRr3mWrAdWJOQzcBJDXEehpFIi6ImtCEqJZQ=; b=UyKVjEu7ILA4X3NhTI3SGYpMQe
	1/rxGlxh0AYi9QEmyUzDMmQtA2PYprpMucifZMr4bDLIvqs7n0TbaWzXtkmIl83ufZ7rfHeRtp4NS
	Y8nQcFWk3GU7mv6AsGAJ790V8FOkR1WhAnZA/60GsUKbUwD454fgwSlUe+pjanvSYsCUgkGAE1fzu
	HPtTNd+MOdB4LLDvmjKJyZ5TMTVLfHwgs/1oTq5wdCEfJGKkYvoVWER3CgLzA4vKAOgFmHkB8zqYz
	Ki2enYA63kMOcCjSvQytlrp4p1Mv8unMcX7ax2boaX5hej/v3FiLfjYG/T69ZxbiKxG7a7XDUStZ8
	dIlFUKWA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0glT-0002aU-Qp; Wed, 29 Jul 2020 07:44:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0glE-0002U2-De; Wed, 29 Jul 2020 07:44:25 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.213])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 241AA2084D;
 Wed, 29 Jul 2020 07:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596008663;
 bh=uisBrp03mBj+7I52p1yLCddU9KzH618rf8vZLEo8Blo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Dph5wHjHRyz2edLmnKeCf7nt2rq2NGIOMLn8qX4MjQeY6VrRzSOGRu7fDOqUXe579
 nCSgXVpkOu/vImotkkdF+Xw7c95oEAsXN6b2o82pGQ486jz5kQKA1Vdsto0jCu89zW
 8+YcpSc66SljkuWLQmi1sMuEFYpB6HmvLRqnFNi4=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH 2/2] soc: qcom: smd-rpm: Fix kerneldoc
Date: Wed, 29 Jul 2020 09:44:15 +0200
Message-Id: <20200729074415.28393-2-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200729074415.28393-1-krzk@kernel.org>
References: <20200729074415.28393-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200729_034424_599485_237AF14F 
X-CRM114-Status: GOOD (  13.38  )
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Fix W=1 compile warnings (invalid kerneldoc):

    drivers/soc/qcom/smd-rpm.c:35: warning: Function parameter or member 'dev' not described in 'qcom_smd_rpm'
    drivers/soc/qcom/smd-rpm.c:99: warning: Function parameter or member 'state' not described in 'qcom_rpm_smd_write'

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/soc/qcom/smd-rpm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/qcom/smd-rpm.c b/drivers/soc/qcom/smd-rpm.c
index 877b13850730..1d4eb46b417a 100644
--- a/drivers/soc/qcom/smd-rpm.c
+++ b/drivers/soc/qcom/smd-rpm.c
@@ -20,6 +20,7 @@
  * struct qcom_smd_rpm - state of the rpm device driver
  * @rpm_channel:	reference to the smd channel
  * @icc:		interconnect proxy device
+ * @dev:		rpm device
  * @ack:		completion for acks
  * @lock:		mutual exclusion around the send/complete pair
  * @ack_status:		result of the rpm request
@@ -86,6 +87,7 @@ struct qcom_rpm_message {
 /**
  * qcom_rpm_smd_write - write @buf to @type:@id
  * @rpm:	rpm handle
+ * @state:	active/sleep state flags
  * @type:	resource type
  * @id:		resource identifier
  * @buf:	the data to be written
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
