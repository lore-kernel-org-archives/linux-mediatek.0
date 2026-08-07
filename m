Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC9A0C5AC7C
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2026 09:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KIWGEh9Ufcm6qiadbjnDxFEVPk5jpDGnhvZvsj6Ps4M=; b=c1QcDy18rDyC0OLWRSswCTegEy
	H2waXs3yX/dp+CseaFGIV5tGDuXQkEzPUBRq4qJjihYTVNMxztxhEg3yHC3/f3BYd34zrtd5iIbH5
	mAnJOWKAi2L8fR0SvTm1uyM7/OJPR87InCepbsVp/xZ2k/76kJKf8Tg6jys/Y084A36S8XoVN5Z67
	ZE2bbDKmCmINcQ/VqCpEkL34FkscCCfdTdnCRDfZgUz6hjqILoyHFrUSqL+/ZhVUH09G0gN/2DUkB
	AvlnPouhmt/Vw9Ee2i7IG2pIPetKuEtrOuP6hiiFguCmpJ3ZzpsctDnhG7YJbid4A1yGvatmzEnnE
	R3uMnrFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsGae-00000007UKD-2IvK;
	Fri, 07 Aug 2026 09:10:08 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsGab-00000007UJ4-2Fiw
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Aug 2026 09:10:07 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-8485b358552so2678922b3a.2
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Aug 2026 02:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786093804; x=1786698604; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KIWGEh9Ufcm6qiadbjnDxFEVPk5jpDGnhvZvsj6Ps4M=;
        b=OFCIhzPciys4VyZvraYfZzqqRz6jqve7lSEyFZ3BMR8GfAMect2Xu0Vy9wYzk6pW4/
         u9DpSyDSxde66BwDoym/jzBY3uDC4JVnKMgAH3BC1K/JFXX1tj+wzDHGkhMvvrFryuHz
         tS0pGWWmbCisF7wNnkpqxc7/Qd0NxPJLrjz2IzEqE4aVCEfNL8cw2vVmaWuyxVPHdgfs
         SQq1ToOvk3ipd8um1ereH0oBdU+7hXn1v3BkDM5h3cVd2yojO+Y6C4gJdpF7J1oVi5f2
         15Lo00iqqCrijgJnFFy2qyosqVnxbygySQjFgXiOt1sGPyKod+eyjSt7W5i6RZ8UHtGl
         6LfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786093804; x=1786698604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KIWGEh9Ufcm6qiadbjnDxFEVPk5jpDGnhvZvsj6Ps4M=;
        b=OvZ98y2ZXPLEsRGhPXSifQJ93xU1mNNjAkZAm7I5UXIT6SHj0aQQ5kT5UrpoWYRRsA
         DIYnjtu6KiQPbqsqFJ9xAec3sh4IrQ1OEIor73UBtnYZ5p9zx3nxe6toT0b3MoxCkYg2
         xtadcV4IiPMO7L0KmgHHOH3joDgiBcnNTThhlwbo/LX2Va0vX6YhdPHBY761krHuMm6U
         4aaX773gEVo3FRmsQqLOB+FnSpT9iLOH16GUUFTUvg3j0HvyyjdSmH1+nvIdA4GN6KJd
         EqpDfbyzfOIHO+T7loyxndJrrH7oBSunnoSBZY7TwsGTCcYBRgtLH3zAHk/C11B9Mdwu
         HRLw==
X-Forwarded-Encrypted: i=1; AHgh+Rr2421C0dCUm+c6pNJN/Yb67XeRPGIMOrOGUSwkKyYg3RlvJ1aAg0QaifTqH7Y8G6mCW4YWnCrdwcVL0t3aKA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzj/hnUvz6jCHrH86iW18mg4OMAgFV9a80p6vuDh9OFkDigAaff
	k1jxBHFH2RkQhQMROztXuqVzM+1WHaRKmNqu3HBohcs0L/OAZ70VVTf4
X-Gm-Gg: AR+sD11kWJdBviXHFl+b0sYZMu//RWYXxMgF9i02hMIQe4nQNPt14vXOEv3RJd0URHI
	ZySEuVyPCATtae4rkUeeGdyJp3sthIE1m4FUK2qfU3T+JgxylPliHdNlZcuz1w7eRyS7VvCM9QO
	0TT7dKT3IlU57U0vQwhqQCbCM+tnzKirg5EtCb1DTSH5miKGcMCbcrY4CJwZjaAgppqiB0GHSJP
	s6LbRX+AAe3601JLXYbk7uKih18H19xZnLflX0dfKrn9FXPxtGGBL9ZYjgHfb4HuTa+EsdAg+dX
	d9UwbPXMT0ha7BassS1H4JwDHXtUprEbC2WHbbCiXjKuT7oKXzHUC3yJ9lFjfFFUNYmSg+2vRnl
	6ZJNm7T5Xr69U4oej71xzA+b4UDkU3o/4r3f0dyCXaQxcHaTNLwiOV5y17ZFS/X7B/V3NqqvB2Q
	Y3nwpq4A+7GMXdIhIaXOdrnyYYHL1y/GDiqF8QiELKBaqDo4ueigJYGIpHfTXc623fPpctRN4Ox
	uZBD/wSTK52YRqqDoKM6CyK5Q8VMy9TBsztbza4RRcmpe+I8Kqc9tw2gG5maF0JlAFKLiTehA8r
	dz6a
X-Received: by 2002:a05:6a00:a116:b0:846:bc60:5bf7 with SMTP id d2e1a72fcca58-84f2dfcf7f5mr24182425b3a.6.1786093804529;
        Fri, 07 Aug 2026 02:10:04 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a552859sm715908b3a.42.2026.08.07.02.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 02:10:03 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Jiri Slaby <jirislaby@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Frank Li <Frank.Li@nxp.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Yenchia Chen <yenchia.chen@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Zhiyong Tao <zhiyong.tao@mediatek.com>,
	Sherry Sun <sherry.sun@nxp.com>,
	Robin Gong <yibin.gong@nxp.com>,
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
	Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Zong Jiang <quic_zongjian@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Aniket Randive <aniket.randive@oss.qualcomm.com>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
	Anup Kulkarni <anup.kulkarni@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/3] serial: qcom-geni: Propagate errors from optional IRQ lookup
Date: Fri,  7 Aug 2026 16:09:43 +0700
Message-ID: <20260807090945.41690-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_021005_575262_7C865F6D 
X-CRM114-Status: GOOD (  12.35  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

platform_get_irq_optional() returns a positive IRQ number on success or
a negative error code on failure. For an optional IRQ, -ENXIO indicates
that no IRQ is available, while other errors should be propagated.

Propagate errors such as -EPROBE_DEFER and -EINVAL instead of continuing
probe without the IRQ.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/tty/serial/qcom_geni_serial.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 7ead87b4eb65..240a6d67d847 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1883,8 +1883,13 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 	uport->irq = irq;
 	uport->has_sysrq = IS_ENABLED(CONFIG_SERIAL_QCOM_GENI_CONSOLE);
 
-	if (!data->console)
+	if (!data->console) {
 		port->wakeup_irq = platform_get_irq_optional(pdev, 1);
+		if (port->wakeup_irq < 0 && port->wakeup_irq != -ENXIO) {
+			ret = port->wakeup_irq;
+			goto error;
+		}
+	}
 
 	if (of_property_read_bool(pdev->dev.of_node, "rx-tx-swap"))
 		port->rx_tx_swap = true;
-- 
2.43.0


