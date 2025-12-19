Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43880D7496B
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Dec 2025 09:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mEQfLBNkig6KHxBO+ZBOPBSWtfNwl/mAz8zFq4Fdwak=; b=cym8XYkLSFDdEYmFQicXjbyix+
	92dsB5kc/3SCDLJOUfau0g0VyObb65foks0X4NpRsHJn8Ta2p1bbwouhXeSwf7r7mzeQb87qhR8Nr
	QUNbHPejFYpD+5D5EiCQJLvcqOuOLsb6Wggu2tMc5uLQfcqv2xuLvZLSI2xuKAqFGY9vg+odOi0Dl
	Njeu0EDN+WOULnlFUpWM1QgjtODa25IWF6x8cODPnpsV5DeE+6H44G37Wek2nVl43rYkDEVgbpqyX
	Uatqfsw1LmMKwbl+AVSJTeGHSoYqtu6A3xYJel+/Bk7MBkfyEYzGVyFJiQ80ocqZO6ve+uJ0ibflj
	62nWlfAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWWkU-00000009wF7-1YNC;
	Fri, 19 Dec 2025 09:26:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWWkT-00000009wDu-1eHH
	for linux-mediatek@bombadil.infradead.org;
	Fri, 19 Dec 2025 09:26:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=mEQfLBNkig6KHxBO+ZBOPBSWtfNwl/mAz8zFq4Fdwak=; b=ilhu46EzvIlxY7lUHHkXV+dXC9
	CVyF4GfJxRSuVaNWbm4GdaI4Sg2nRmdxE9EvxbOoC7JKdLngp4xqYxGlVfGDWDplCjrf7OrPJ2PfQ
	GRycdyjK4akGnrOHbfdXtSPDxTbf34B2Xm+s+hs8PnqywnUuPEMCM2UiM2FKStVxG/aP/CsB+tqja
	6ENNOkGkqyFhKtwHZFbwpxrXnuif3u/TqoyPkGMzyhFtx/q2+0keDDEsb8Y9gSFjELzkvLhis4Tds
	hGcLZjSYIVS3fyAQ8KktZCCqHQtcje3ttcqHueVS7U4cJ/dEhcLXBF7D5VTgvnEiyzYnLCgUBndiL
	WeGuqfkg==;
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVsv-0000000ATVN-32lJ
	for linux-mediatek@lists.infradead.org;
	Fri, 19 Dec 2025 08:30:53 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-42fbc305882so803287f8f.0
        for <linux-mediatek@lists.infradead.org>; Fri, 19 Dec 2025 01:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1766136361; x=1766741161; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mEQfLBNkig6KHxBO+ZBOPBSWtfNwl/mAz8zFq4Fdwak=;
        b=YcnNqOZDb3JJi/ttsb6H52aNceYKM/nrOkRPfVQhejPHRzVhTMcN+FTxfaEd2WcXfg
         llPw0GnQw9JewPMZWB++q4ps+2a0gPy5ZtiyuhqgAlS2wB238lLJlBIGDsMhx74mPLHD
         Epm8uCAskENlSO1HRzAyiCfYsSgMt+s47rlTgbVAUlXT/VQEQ5s+Gp7ft1dhJsaj0mk6
         92gB87py06/6GBBE2MYwU+tHvN/VTa8OGqCtGmQZBr1rVhVTwljkD78ZZ6wJcLF/sBlF
         +UkYKWOjTQaygJmS+N1dcPORCs+JBJjSfQ3btQo7IlyUMXg3F4BgRRouT40/JBDP3aHU
         Dwew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766136361; x=1766741161;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mEQfLBNkig6KHxBO+ZBOPBSWtfNwl/mAz8zFq4Fdwak=;
        b=mshNmIeCg05aMOjYgiF/6fGYIuR9YquE0K7eL5DOvWlWfp8Y2nROViCWQ8jm8zbJzQ
         +8LGdln75REn98z43IA9qhdfk1FCL4mQazfmyFICll0uReoHCfwttR7FCACYD+YbrCQU
         bwJEROUtgVN/qlVGjXjBwQcM9BwSEx3owrGsNV6lILhRBiCu80HQLvkiJh19fKT7vXNJ
         WUNkk2HwDRGQPuJAqDWmO5Gin1RYXtF/TC4c2jWmB0WBFG/ic/shCXdGOhCLnQmNVioB
         +eEtcrfAfOkx7mgSEDd9cNAaSjW3kTYRYp/gLIh3MNUmWtXZpIOAJjR8ja89kkTkvBNZ
         SUxw==
X-Forwarded-Encrypted: i=1; AJvYcCXl3qgSWXETJ/p3B1Nx3+bIhypdxHiy+2FMRioZyEkIkNJx7BbgcjySS2hkrqvadMkgXZVLFAWwWdt6i7T/UQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzL8Wds7uR1kA4mnLl7JITdNOm4JMg7JhINX/Iosm+TAiZDAxZy
	IeKnT+hS7HJnl2htD0RXfaQHdxNlPfOWjOUH50CMuYIHVQW6yev4TQqgokIOs0fk7NU=
X-Gm-Gg: AY/fxX6Sb5yckaiJ2bwyQ7EWL6bMYWvf8h7nO2efdKxYhWY8kGqOHnMNBuILqYM0Q2Q
	cwmYPmaEqRv5vQ4YgeER660zUsuVU4LjlK1datNX8pioYphlEC7v8CPdTWDHG5ixnnMvqg7QDip
	/rj/D+lxIq8mSTBha3eKeluPN9eNylk2KKHugwXwSPu5n8wcsv4oAzxrRc/hSUew1GgKiPXdFch
	oxMTRSpCtrQzGD736ezvrzZ7ruUmnT7DvySZLuv6tdf+kMGvR4BL3qc/gbOSI+/AeZjqHZFsKxF
	Pw9JF6rQzr5kuOscNK4Irc43CKvlkYKZqY87o+J/udfyeDniPzzkv3fdGPfy9h0Ntdu88kN82KL
	7SBtIx43KE8Jw+0xutaXwLe5l9/GTC9M3CXWjYKmhJQIlWbg2F/45qVwHJlLUpvWMpGVOad0l1L
	nkiDnki7nGOpKEQawYuk8ti/MvlYN8X5igvpj/RKY2Lj7s6npVsM6jXe4g8I3GVwHOdRFvwUIkz
	g8=
X-Google-Smtp-Source: AGHT+IE/hZW3FJZsWVHdzVUWg5J9RwD+/ADUpNftxPBYvak62/hf0PU8XHFORkZeSi00XISdKG3jGg==
X-Received: by 2002:a05:6000:24c7:b0:431:1d4:3a8f with SMTP id ffacd0b85a97d-4324e506840mr2543450f8f.47.1766136360735;
        Fri, 19 Dec 2025 01:26:00 -0800 (PST)
Received: from localhost (p200300f65f0066087cf387e078e1a5dc.dip0.t-ipconnect.de. [2003:f6:5f00:6608:7cf3:87e0:78e1:a5dc])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4324ea82fa1sm3710071f8f.23.2025.12.19.01.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 01:26:00 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	=?utf-8?q?Kai_M=C3=A4kisara?= <Kai.Makisara@kolumbus.fi>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Peter Wang <peter.wang@mediatek.com>,
	Bean Huo <beanhuo@micron.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Christoph Hellwig <hch@infradead.org>,
	"Bao D. Nguyen" <quic_nguyenb@quicinc.com>,
	linux-scsi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 0/8] scsi: Make use of bus callbacks
Date: Fri, 19 Dec 2025 10:25:29 +0100
Message-ID: <cover.1766133330.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2378; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=IAdbxss3dLrcOoQ0t9BI37AncWy3V4wOjCAq5w1hmNA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpRRoN8BONrIecwy7V+dYl2JORlG8x/4WY3e7rT l5IkkNll9iJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaUUaDQAKCRCPgPtYfRL+ Tls8B/sFjIScuB6gXphaL0wGuHgRBEXVJ3RLWVxVSsgBMOBPVODhIP3eFDGOtIXf3Iv3H15IKm2 PwNN2Idzd2SYtU2mzeB2iJHIhtBNLFmM7UZe6vx+sS0u3wOUNCg6FyRMf3mabtv16sLwI5LM1iF L682E+bV2DoaJbH7XyL1C8s3m1XQhO5nBodi/tiVcPjyWrR+88+Uc8wJG3LXdJMcxuERbyfu+uF aqn9mZeh5k/F3L/NFB0owfoemrjldR6sRk36bInjQcYm1wmDzkQ967pqh+xNj/2dwO0cKtTbUAE kWjHW9Uu6aMldNE86CYiEqUHXzT9DtSLwIY/6t/bep0YI71r
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_083050_428860_4AE1132D 
X-CRM114-Status: GOOD (  14.56  )
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

Hello,

this is v2 of the series to make the scsi subsystem stop using the
callbacks .probe(), .remove() and .shutdown() of struct device_driver.
Instead use their designated alternatives in struct bus_type.

The eventual goal is to drop the callbacks from struct device_driver.

The 2nd patch introduces some legacy handling for drivers still using
the device_driver callbacks. This results in a runtime warning (in
driver_register()). The following patches convert all in-tree drivers
(and thus fix the warnings one after another).
Conceptually this legacy handling could be dropped at the end of the
series, but I think this is a bad idea because this silently breaks
out-of-tree drivers (which also covers drivers that are currently
prepared for mainline submission) and in-tree drivers I might have
missed (though I'm convinced I catched them all). That convinces me that
keeping the legacy handling for at least one development cycle is the
right choice. I'll care for that at the latest when I remove the
callbacks from struct device_driver.

Changes since (implicit) v1, available at
https://lore.kernel.org/linux-scsi/cover.1765312062.git.u.kleine-koenig@baylibre.com:

 - trivially rebase to v6.19-rc1
 - fix a kdoc warning uncovered by the intel kernel test robot
 - rename a few variables to align with the already existing naming in
   the individual drivers
 - slightly reword the commit logs
 - add the tags received in v1

Best regards
Uwe

Uwe Kleine-König (8):
  scsi: Pass a struct scsi_driver to scsi_{,un}register_driver()
  scsi: Make use of bus callbacks
  scsi: ch: Convert to scsi bus methods
  scsi: sd: Convert to scsi bus methods
  scsi: ses: Convert to scsi bus methods
  scsi: sr: Convert to scsi bus methods
  scsi: st: Convert to scsi bus methods
  scsi: ufs: Convert to scsi bus methods

 drivers/scsi/ch.c          | 18 ++++-----
 drivers/scsi/scsi_sysfs.c  | 77 ++++++++++++++++++++++++++++++++++++--
 drivers/scsi/sd.c          | 29 +++++++-------
 drivers/scsi/ses.c         | 15 ++------
 drivers/scsi/sr.c          | 21 +++++------
 drivers/scsi/st.c          | 22 +++++------
 drivers/ufs/core/ufshcd.c  | 22 +++++------
 include/scsi/scsi_driver.h |  7 +++-
 8 files changed, 139 insertions(+), 72 deletions(-)


base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
-- 
2.47.3


