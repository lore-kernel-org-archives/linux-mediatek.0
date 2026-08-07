Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03429C5AC7C
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2026 09:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ElLqReA861EolgaVnlXggqBl/5aqmb9EAPSEfZwWA+w=; b=TSjNlVXxfedjebpaz42wo6WeRR
	WyaEwAv2r3ZveUDfpdy+OPEazYy64sJV2VdyGItuEoa2owiT9WayUfuuTwHaK9CGqWtwvpQnu+Heu
	Hl8t89ibykJyeqCLILWLvDzsd3IHEwHpCj6A8/PG1kGPF7jOzQtk7QziKn7UWzqKIOdfmL2/qAto3
	lwbjVId0xKPxQy6OWubLt0BcaBo2fHpBeV63cX08R/iVhLj6SBC2fFrAhKF7SHVpt+P1NPu2BN7u4
	QpHUHeHNV1VmVKfS3Ua1Cdzy3y138fgsjAlhkrS0aLTUwjyi63QbLjfK/18SAaOZQ+4DoE+4CyA0+
	kMt1l8Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsGaw-00000007UT6-0FsL;
	Fri, 07 Aug 2026 09:10:26 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsGas-00000007UQn-2IVa
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Aug 2026 09:10:25 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-8485bd28dd0so3557681b3a.2
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Aug 2026 02:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786093822; x=1786698622; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ElLqReA861EolgaVnlXggqBl/5aqmb9EAPSEfZwWA+w=;
        b=QtEzOetAoWnIYuLK/Z3FT7ZAcdlAp5csAuQJYchdLe+ZoQyl1YFxSYiLkSpCYmqmO7
         MQBGKjjilcyVHvdbt1TLZx1VvUAg82RvphZHyO2iuDZdBGNwAG2nvaDMERA7BHR6h0OC
         VWRMqmHNyXIvuSQcTJCu1IsT+W90B1kwWwuKcc5NzPje2NZSryGxHAnqsB7RS6XaCwq/
         /MDsM3UWMolr22uZXQQnCrW+inSxvDXohhIOyHN8mfpqyWMfA+RatD6022MXXpEHLuLC
         HN0fU9+5iUjzU6TrNEvHkJ0Y4aieB6RseSbYzziS8r+YNPjKuXmSFrMlYQe2WBOviKbL
         YNPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786093822; x=1786698622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ElLqReA861EolgaVnlXggqBl/5aqmb9EAPSEfZwWA+w=;
        b=MZGaV2rdaVQgxXSQrvm9DaRlUse4RK4EBtC4eTn7NhuCOn5fYb7G5Tk8FQAALMHj3N
         GMpFdaEjqmZvTu1DFqpICgkcpOLE4vAkkujoGXYinmODF0jeI2luB9+FpqD5rmGofNsA
         CzHMwLmy6Z2LYn61zAuESNSwXY3qVqJrW6RmRgwXfx6oV/36xCcOok7AI7enYw2Qe/kK
         X1L/+/cxdZkhtpyFBnyPmdA/8YZt6fEOWg8ahxFxJQY9Lfn6elgUvEIMHasJJAbzgDGE
         EuTr9PiY6XrrB401L1MKgXpCZMmcCu8jKQ996hVIFQ7/MwRdTCfz3s7HgDnZIzNX1Zt7
         +HIg==
X-Forwarded-Encrypted: i=1; AHgh+Ro7pefCnXvojFWqt63sCOPbiEBb5Ws84MOvP73Hg4VnyeZ727V+9y28tZS5OuGg1mWfnqKeQcZV5FudilGTQQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzlcOc86f/l0gHNKY9WwUbM6LfwG1/rRr/8jRG1o5jpXZ7o2q0j
	uT3x5AbSaw6JH1+1Woa+aeqcyaawpj1Y/sMIPqct1vbIVpNii9zvwv4f
X-Gm-Gg: AR+sD11IGW9HG88neN6pw2woOBiU3OUkFzpxg/i3e8NDB1zBE/GsSJcPKH2CiPguut9
	asVO5Z+ldLfbC2JX3RgWu/DwhCX7JcSYmyIx9YtQcrRWXQTS0KzJ8Kz8tUILZNomgCulZgoqT7A
	1zdfn+bZrB8lfryDcG+yJJccDhW8MQWw8KXVw2jpA+n6W+pswyW2dnWG5bqid3GI6p6/izBcMsk
	u8YtYHwA7k0F2n8j34qrPL9A/OjH8weQFFla5k9nkeskPsXS2QvSmR2E6LgiM/SN340xYbuVtFI
	qf7zRJUZuLHpHTvBaIRQ2ftSVRtoeVb4DrIQHvx9wDR+NMCZnJrufZ8PSDnIKlJJxIgZX3SycRA
	VfPXjYLOmcjcNp880m/KVMiOfCCkBNYwW+RnoiwbRehwHp0fCvVBkx3nUB+blzfk3N5hU4HvhZu
	cZ4Lu5OB0oIeBxlY9wqe2cX61LcqFRmM+gsUTC8/E49aUc9AchnQpFn8zirEd9hGSKTeAxKFcIr
	5m/AKJEYXruUR7vGtfI7X5CBPfFbpnuH7Rv6NSN7hiCRK3zbQ47qt0DrZ7oSg+YP6cPHsA6/nmN
	Mp7B
X-Received: by 2002:a05:6a00:f99:b0:845:ebbf:e7be with SMTP id d2e1a72fcca58-84f2e03954amr24222618b3a.23.1786093821837;
        Fri, 07 Aug 2026 02:10:21 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a552859sm715908b3a.42.2026.08.07.02.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 02:10:21 -0700 (PDT)
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
Subject: [PATCH 3/3] serial: 8250_mtk: Propagate errors from optional IRQ lookup
Date: Fri,  7 Aug 2026 16:09:45 +0700
Message-ID: <20260807090945.41690-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260807090945.41690-1-phucduc.bui@gmail.com>
References: <20260807090945.41690-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_021022_588998_D5BD1EC1 
X-CRM114-Status: GOOD (  11.14  )
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
 drivers/tty/serial/8250/8250_mtk.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_mtk.c b/drivers/tty/serial/8250/8250_mtk.c
index e6a56cf54ae0..d0d2aecf9005 100644
--- a/drivers/tty/serial/8250/8250_mtk.c
+++ b/drivers/tty/serial/8250/8250_mtk.c
@@ -587,6 +587,8 @@ static int mtk8250_probe(struct platform_device *pdev)
 		return data->line;
 
 	data->rx_wakeup_irq = platform_get_irq_optional(pdev, 1);
+	if (data->rx_wakeup_irq < 0 && data->rx_wakeup_irq != -ENXIO)
+		return data->rx_wakeup_irq;
 
 	pm_runtime_set_active(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
-- 
2.43.0


