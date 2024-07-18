Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 466D0C3DA61
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jul 2024 18:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XqkTMc+mOYHApBz/sQYA4SzkOLX6ohS5kG1Zs0WnbLI=; b=COgCNyZXOkJHAwar7MXJys3d+w
	WJANCZ/oHP0fUE0cXKMDzySv1CdJs90Zj2xGOMLPv+k8tVd3PXsN55fxw1BpTOKU17cpkbGaassPZ
	ZXGNVV+/F8uJW5HGa1EGY/wn1JlSrkRJeL2eTdTNqJ8Z3/b3v/db3JHhoU6/cjBA2UebBKvFklSiZ
	SLsYdR51B0nES6m33OTNk6pBDj3Zo/HqJooLj0Lenmbcsayl9nP/TWdxmIVvsD8lbJmyVXrwTBenL
	BI4OK0QiLblZFnOMuh7gQasOo6lVA8xd95VN4iLnhyy9GsG5njrxnhL8VZMcG4g5nytkY60U9nyjQ
	0q8oWA9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUVu4-00000000Lsz-0p68;
	Thu, 18 Jul 2024 18:30:56 +0000
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUVu1-00000000LsM-01mb
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Jul 2024 18:30:54 +0000
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-25e1610e359so464004fac.1
        for <linux-mediatek@lists.infradead.org>; Thu, 18 Jul 2024 11:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721327452; x=1721932252; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XqkTMc+mOYHApBz/sQYA4SzkOLX6ohS5kG1Zs0WnbLI=;
        b=AkO5qnbx1kwHzqzljcwEeEWQbu5l+DdPkuBgoel/bQkNYZBXQ9CCG9nVakPQQUr7O4
         6EJ4qVeJA4WHTZRSE9F2s/nCmDUBA8G679z7RI9eBAUBSeVPCldLXs9BbiT0oWd7Vf+9
         MAmL+MPYY/a05afCKxz2Nvc8ZVQvapp7VV31bgg2PIpGGiE4GJJK9RDV1GoKGW80mJ59
         NGvdnnlSUwEkjtct4M4pxRrLKysIawBIG/GBg2KpxobbvfQuOiQbEJc+1zEHrzXrAl+h
         Xep2dnBV3LuMfR3ggp8ExPPkYSNY+32zL7RX+09zX7t6zwOO4uYQyEkjDr3hnTejBTPE
         5j4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721327452; x=1721932252;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XqkTMc+mOYHApBz/sQYA4SzkOLX6ohS5kG1Zs0WnbLI=;
        b=TcEJ5EI1CVysdAaiRfhRODyTYg/K/QlnUBOkWczY0IN8aE9P3MY5gpISRRdFJQx1CD
         KdaDYTtIPQ2NnmDV/7FS+pu6iD7h70L7ZggH1z3BtOPixZSC0XyhEqawc8pQip9Z7eNu
         ykWx/ed/zEiwRZ1UbxCNgBRsdXK5B0dXW8P6vC7V1WY8XBkEOmGKQKfDTiOh24E6KCjX
         yBgwv8fzucQjMPT3TDksCrRqB3qaVAnCr4tyyMIe6+mIA9ki4MQjaPcpFuznogQOB1VM
         AIxkA0RvDpPighfmMyXYzPQmlpA6jrIEJ6OsIDlQbYpOtun2KdJhQUgyPPzPWZvssjux
         giXA==
X-Gm-Message-State: AOJu0YwgdW/nZJlg5c8nUOpm7kbCmEnqUwUwadKGKzrfcuN4HqC0Q7By
	oIxr98bXczqqzw1yLj2Q2JjNHft5vraLFwiLzaT6QKM2cjkfDf2ftJ47IDSHeH8=
X-Google-Smtp-Source: AGHT+IF2Rf2lZbgXKHkYZEBrZOmNtzN15r/kdtVgpLm7a3YXvJUNOogiy7Wy84S+L7HTrq68vnWTjQ==
X-Received: by 2002:a05:6871:7242:b0:25e:bd07:4743 with SMTP id 586e51a60fabf-260d8df0b57mr5105010fac.0.1721327451785;
        Thu, 18 Jul 2024 11:30:51 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:8d5a:14eb:55d7:f0ba])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-260ee8d2d3bsm451689fac.42.2024.07.18.11.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 11:30:51 -0700 (PDT)
Date: Thu, 18 Jul 2024 13:30:49 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-mediatek@lists.infradead.org
Subject: [bug report] net: airoha: Introduce ethernet support for EN7581 SoC
Message-ID: <395b364b-8a37-40ce-ac24-4f0bd7eb0e2a@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_113053_070840_3D18A134 
X-CRM114-Status: UNSURE (   7.28  )
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

[ These Smatch tests aren't published.  They produce way too many false
  positives for me to release them. - dan ]

Hello Lorenzo Bianconi,

Commit 23020f049327 ("net: airoha: Introduce ethernet support for
EN7581 SoC") from Jul 12, 2024 (linux-next), leads to the following
Smatch static checker warning:

    drivers/net/ethernet/mediatek/airoha_eth.c:1183 airoha_fe_pse_ports_init()
    warn: why is the last element skipped?

    drivers/net/ethernet/mediatek/airoha_eth.c:1369 airoha_fe_init()
    '0x60000 | 0x60000' has '0x60000' set on both sides

drivers/net/ethernet/mediatek/airoha_eth.c
    1134 static void airoha_fe_pse_ports_init(struct airoha_eth *eth)
    1135 {
    1136         const u32 pse_port_num_queues[] = {
    1137                 [FE_PSE_PORT_CDM1] = 6,
    1138                 [FE_PSE_PORT_GDM1] = 6,
    1139                 [FE_PSE_PORT_GDM2] = 32,
    1140                 [FE_PSE_PORT_GDM3] = 6,
    1141                 [FE_PSE_PORT_PPE1] = 4,
    1142                 [FE_PSE_PORT_CDM2] = 6,
    1143                 [FE_PSE_PORT_CDM3] = 8,
                         ^^^^^^^^^^^^^^^^^^^^^^^

    1144                 [FE_PSE_PORT_CDM4] = 10,
    1145                 [FE_PSE_PORT_PPE2] = 4,
    1146                 [FE_PSE_PORT_GDM4] = 2,
    1147                 [FE_PSE_PORT_CDM5] = 2,
    1148         };
    1149         int q;
    1150 
    1151         /* hw misses PPE2 oq rsv */
    1152         airoha_fe_set(eth, REG_FE_PSE_BUF_SET,
    1153                       PSE_RSV_PAGES * pse_port_num_queues[FE_PSE_PORT_PPE2]);
    1154 
    1155         /* CMD1 */
    1156         for (q = 0; q < pse_port_num_queues[FE_PSE_PORT_CDM1]; q++)
    1157                 airoha_fe_set_pse_oq_rsv(eth, FE_PSE_PORT_CDM1, q,
    1158                                          PSE_QUEUE_RSV_PAGES);
    1159         /* GMD1 */
    1160         for (q = 0; q < pse_port_num_queues[FE_PSE_PORT_GDM1]; q++)
    1161                 airoha_fe_set_pse_oq_rsv(eth, FE_PSE_PORT_GDM1, q,
    1162                                          PSE_QUEUE_RSV_PAGES);
    1163         /* GMD2 */
    1164         for (q = 6; q < pse_port_num_queues[FE_PSE_PORT_GDM2]; q++)
    1165                 airoha_fe_set_pse_oq_rsv(eth, FE_PSE_PORT_GDM2, q, 0);
    1166         /* GMD3 */
    1167         for (q = 0; q < pse_port_num_queues[FE_PSE_PORT_GDM3]; q++)
    1168                 airoha_fe_set_pse_oq_rsv(eth, FE_PSE_PORT_GDM3, q,
    1169                                          PSE_QUEUE_RSV_PAGES);
    1170         /* PPE1 */
    1171         for (q = 0; q < pse_port_num_queues[FE_PSE_PORT_PPE1]; q++) {
    1172                 if (q < pse_port_num_queues[FE_PSE_PORT_PPE1])
    1173                         airoha_fe_set_pse_oq_rsv(eth, FE_PSE_PORT_PPE1, q,
    1174                                                  PSE_QUEUE_RSV_PAGES);
    1175                 else
    1176                         airoha_fe_set_pse_oq_rsv(eth, FE_PSE_PORT_PPE1, q, 0);
    1177         }
    1178         /* CDM2 */
    1179         for (q = 0; q < pse_port_num_queues[FE_PSE_PORT_CDM2]; q++)
    1180                 airoha_fe_set_pse_oq_rsv(eth, FE_PSE_PORT_CDM2, q,
    1181                                          PSE_QUEUE_RSV_PAGES);
    1182         /* CDM3 */
--> 1183         for (q = 0; q < pse_port_num_queues[FE_PSE_PORT_CDM3] - 1; q++)
                                                                      ^^^^
This - 1 doesn't look intentional.  It's the only time this value is used.

    1184                 airoha_fe_set_pse_oq_rsv(eth, FE_PSE_PORT_CDM3, q, 0);
    1185         /* CDM4 */
    1186         for (q = 4; q < pse_port_num_queues[FE_PSE_PORT_CDM4]; q++)
    1187                 airoha_fe_set_pse_oq_rsv(eth, FE_PSE_PORT_CDM4, q,
    1188                                          PSE_QUEUE_RSV_PAGES);
    1189         /* PPE2 */
    1190         for (q = 0; q < pse_port_num_queues[FE_PSE_PORT_PPE2]; q++) {
    1191                 if (q < pse_port_num_queues[FE_PSE_PORT_PPE2] / 2)
    1192                         airoha_fe_set_pse_oq_rsv(eth, FE_PSE_PORT_PPE2, q,
    1193                                                  PSE_QUEUE_RSV_PAGES);
    1194                 else
    1195                         airoha_fe_set_pse_oq_rsv(eth, FE_PSE_PORT_PPE2, q, 0);
    1196         }
    1197         /* GMD4 */
    1198         for (q = 0; q < pse_port_num_queues[FE_PSE_PORT_GDM4]; q++)
    1199                 airoha_fe_set_pse_oq_rsv(eth, FE_PSE_PORT_GDM4, q,
    1200                                          PSE_QUEUE_RSV_PAGES);
    1201         /* CDM5 */
    1202         for (q = 0; q < pse_port_num_queues[FE_PSE_PORT_CDM5]; q++)
    1203                 airoha_fe_set_pse_oq_rsv(eth, FE_PSE_PORT_CDM5, q,
    1204                                          PSE_QUEUE_RSV_PAGES);
    1205 }

drivers/net/ethernet/mediatek/airoha_eth.c
  1366          airoha_fe_set(eth, REG_FE_CPORT_CFG, FE_CPORT_PORT_XFC_MASK);
  1367  
  1368          /* default aging mode for mbi unlock issue */
  1369          airoha_fe_rmw(eth, REG_GDM2_CHN_RLS,
  1370                        MBI_RX_AGE_SEL_MASK | MBI_TX_AGE_SEL_MASK,

The RX and TX masks are identical.  Possibly correct but #Suspicious.

  1371                        FIELD_PREP(MBI_RX_AGE_SEL_MASK, 3) |
  1372                        FIELD_PREP(MBI_TX_AGE_SEL_MASK, 3));
  1373  
  1374          /* disable IFC by default */


regards,
dan carpenter

