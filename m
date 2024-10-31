Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D17FDD5CCAB
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Oct 2024 00:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tf88+MjxuRscGCJUWSV+JgU09beZteKvue7KtOwrEjg=; b=u5NgOUDtFoXuAPVldb1IyISZxR
	77ZC3OmIgzQb9z3d+JuNm/OVuwhMOH5VuX+NzwiDtZjftSWlFPmYqZHaZKwswjBD/m1GLasKd4NAZ
	rnhVWRcYZwSXJcanwcB+qKCuhomDRxaWDZvMav1pBJSI/9uR9O9TKtJNwjTEjnXGA5lNa/Qh19Bvr
	MqUlQjQirEWco/WdtXbHWRaIWWPdcSzpePJQP/TsY42lUGqY39lrabbtZx3mUfCDOKUIKY9wg2Uxt
	gcZwKIJ0vio9dF4+iDSLQVbRIpS/J/CI/tlHvwWB6iIjmzmK6tgspoDatOo53XmDGuq6YrTOFqOTN
	py1vZwKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6JJ1-00000002B1t-1X2p;
	Thu, 31 Oct 2024 00:44:55 +0000
Received: from mail-il1-x162.google.com ([2607:f8b0:4864:20::162])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6IyX-000000029A2-45AA
	for linux-mediatek@lists.infradead.org;
	Thu, 31 Oct 2024 00:23:48 +0000
Received: by mail-il1-x162.google.com with SMTP id e9e14a558f8ab-3a3a4fac259so293945ab.0
        for <linux-mediatek@lists.infradead.org>; Wed, 30 Oct 2024 17:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1730334224; x=1730939024; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tf88+MjxuRscGCJUWSV+JgU09beZteKvue7KtOwrEjg=;
        b=S81gFVpGivY9SgrA5z8Zb3ItGU/OsiKCYXFUt3bZiQeKGqr5RYI/yGzZfVbTksi7X/
         nmDI8jOvxuwsbDk4QLiLYTgtTcdHaCKLq7ZlzbTAs+lWAxAKjIpT6vLznME6zAXTZeuy
         0Kt7Nynboc76ufGGTC36YPN3imoxAIX0hYl/L9cBaiHfHb3sFDjYpsrOK/0ULGZPdmew
         4c6IgD1yhwT9GtBZqafQnpApuMIuP0miPY8ihMWTQXfmm+1siicca93AQdmjOuejt0/C
         ziTpQQDs0d8TEq2hwVe3ah1rqmhap/ObGnPG3uujErvLlfqUfDgFUUov5m5sWWPStaar
         DL2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730334224; x=1730939024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tf88+MjxuRscGCJUWSV+JgU09beZteKvue7KtOwrEjg=;
        b=vSaSSpg7eMQjseabG7wo0JgnWnTb3XznxOEeJe1mfBtecVrT1nZkcotxifaOkC08/w
         mRqFDJuKi1lo7x9GbXnJlfAmtCkO9uCObisjwJqeGqF2rHE++WrNMPcucEp3giuHTclY
         X3AT8gNG6T8tHXzgWn4P3tsAuWB8lJ1PrYAGT7cVTA4fYcmESFCR8VjuG3sydanoCy8d
         k9mpnTHtrUFq8SCOOF5PVIoiiqA4eQv9bLsCHstlaSd0hD2EbUBrYmrmWvqIDIkTUDIx
         CzCg3SyDR5QMn/ygMUuCOQU+89PxgjX1iQ96twvIESsSeDoiGSwH6PS0KMTJkrwr4jfO
         S+jw==
X-Forwarded-Encrypted: i=1; AJvYcCVi8UqY5c7+zm9WvfWOuiquqnaDOkSoNZEgPRPtGyro9veXEpU/Za9jMkPVN7Roa4sZK7/HytwsSRKuQxehNw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxTR+KmaYnzhJZ585YfeNS/zjykRgkvyNKd+UErqiyHsQ5ncUWG
	F6toWl3FbgZcsnyolCxKu5zO4aaDUl+xnG3wURj6IJuWk9V0yrgph62mI9rgTFX6QA1gshBp02T
	S/croGrEraUi7jUVgYRypPaggtNaYo3BdMgbhg/zOsXbp1mAP
X-Google-Smtp-Source: AGHT+IFctfwfFkMLSXWKissVysXhbwAhZuukj/l7GUQRUQP8VHt+M3bWpakPEOY0QFlU+31rWrfy/nfQ3PTS
X-Received: by 2002:a92:ca47:0:b0:3a0:a1ab:7ce6 with SMTP id e9e14a558f8ab-3a4ed26cc3amr47563395ab.1.1730334224191;
        Wed, 30 Oct 2024 17:23:44 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
        by smtp-relay.gmail.com with ESMTPS id e9e14a558f8ab-3a6a99c9259sm108935ab.46.2024.10.30.17.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 17:23:44 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (dev-csander.dev.purestorage.com [10.7.70.37])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id DC5C734039C;
	Wed, 30 Oct 2024 18:23:42 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id D5083E40A10; Wed, 30 Oct 2024 18:23:42 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Arthur Kiyanovski <akiyano@amazon.com>,
	Brett Creeley <brett.creeley@amd.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	David Arinzon <darinzon@amazon.com>,
	"David S. Miller" <davem@davemloft.net>,
	Doug Berger <opendmb@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Felix Fietkau <nbd@nbd.name>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Geetha sowjanya <gakula@marvell.com>,
	hariprasad <hkelam@marvell.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jason Wang <jasowang@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Leon Romanovsky <leon@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Louis Peens <louis.peens@corigine.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Michael Chan <michael.chan@broadcom.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Noam Dagan <ndagan@amazon.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Roy Pledge <Roy.Pledge@nxp.com>,
	Saeed Bishara <saeedb@amazon.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Shannon Nelson <shannon.nelson@amd.com>,
	Shay Agroskin <shayagr@amazon.com>,
	Simon Horman <horms@kernel.org>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	Sunil Goutham <sgoutham@marvell.com>,
	Tal Gilboa <talgi@nvidia.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: Caleb Sander Mateos <csander@purestorage.com>,
	intel-wired-lan@lists.osuosl.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-rdma@vger.kernel.org,
	netdev@vger.kernel.org,
	oss-drivers@corigine.com,
	virtualization@lists.linux.dev
Subject: [resend PATCH 1/2] dim: make dim_calc_stats() inputs const pointers
Date: Wed, 30 Oct 2024 18:23:25 -0600
Message-ID: <20241031002326.3426181-1-csander@purestorage.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_172346_068302_07C45A83 
X-CRM114-Status: GOOD (  11.09  )
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

Make the start and end arguments to dim_calc_stats() const pointers
to clarify that the function does not modify their values.

Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
---
 include/linux/dim.h | 3 ++-
 lib/dim/dim.c       | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/linux/dim.h b/include/linux/dim.h
index 1b581ff25a15..84579a50ae7f 100644
--- a/include/linux/dim.h
+++ b/include/linux/dim.h
@@ -349,11 +349,12 @@ void dim_park_tired(struct dim *dim);
  *
  * Calculate the delta between two samples (in data rates).
  * Takes into consideration counter wrap-around.
  * Returned boolean indicates whether curr_stats are reliable.
  */
-bool dim_calc_stats(struct dim_sample *start, struct dim_sample *end,
+bool dim_calc_stats(const struct dim_sample *start,
+		    const struct dim_sample *end,
 		    struct dim_stats *curr_stats);
 
 /**
  *	dim_update_sample - set a sample's fields with given values
  *	@event_ctr: number of events to set
diff --git a/lib/dim/dim.c b/lib/dim/dim.c
index 83b65ac74d73..97c3d084ebf0 100644
--- a/lib/dim/dim.c
+++ b/lib/dim/dim.c
@@ -52,11 +52,12 @@ void dim_park_tired(struct dim *dim)
 	dim->steps_left   = 0;
 	dim->tune_state   = DIM_PARKING_TIRED;
 }
 EXPORT_SYMBOL(dim_park_tired);
 
-bool dim_calc_stats(struct dim_sample *start, struct dim_sample *end,
+bool dim_calc_stats(const struct dim_sample *start,
+		    const struct dim_sample *end,
 		    struct dim_stats *curr_stats)
 {
 	/* u32 holds up to 71 minutes, should be enough */
 	u32 delta_us = ktime_us_delta(end->time, start->time);
 	u32 npkts = BIT_GAP(BITS_PER_TYPE(u32), end->pkt_ctr, start->pkt_ctr);
-- 
2.45.2


