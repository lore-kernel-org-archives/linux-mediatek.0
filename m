Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60459EE4991
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 11:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+hEGSpMBn03EiNQyLgug6eukNiwXd245jyNa4Wj3sFs=; b=h53uiGyIcW50W7xF7MmT0ylHUX
	2f24XKhQtVwg4NlbnNqFzRA8oQSQULktxlkZrIXSo41UfBE0VN6C8SkFaHYuh5bKN4AgZhw14Yh9l
	MndrGRWjogQK/pGoF9ai72thj0US/wb9xsoGiVouuubN1BFx6zFNSIAozByNO4cJdHG050zbsREkm
	eNRK9pR3OWiGVXSLEC4bB0w1+Aj9DLv0CTT1qwGiRlFZsISK9HwqRZYD9N6z/pLBzGcIknUxJCIi6
	RRC2PDejwAZiW6Gre8dhaJtPeFHdlIiUHZdpO2EAbE04wRjRvRDG4XlC1SyhTnKBFUvtiL4hEaSc/
	VGRq/bdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soLHO-00000009FO7-0Jw9;
	Wed, 11 Sep 2024 11:12:58 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soL7X-00000009DER-3LqQ
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Sep 2024 11:02:49 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-37747c1d928so4160227f8f.1
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Sep 2024 04:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726052565; x=1726657365; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+hEGSpMBn03EiNQyLgug6eukNiwXd245jyNa4Wj3sFs=;
        b=V2EF7tkxhxf1UR9HwTyZu7lekcf0xhzaKbo6huypr5CvLZoTCJ2QqP51U+BJLwKcaz
         W2jo/NmBpAVIjLyGgP2gEJO1ke93o8lpvSD+gj5/AoXo0oSfKxUMlYaKwlKDMO7C4dzr
         CkhD4F9BPKdmRC8szosBiEPhHsCXtTYUcwEdMMTYaW/AmK0Bofc+AXpIbrSIG4L+8e7z
         12KrmM/jlOlM6zJx6VBkuPluBR8Iiip+ztIUJsxhfPXmg2jj8ADOWDs3rHr5LOLViKRt
         NfLHHPJn9gSr8D8PNc9AJzpwjTBUv5nyOY2Tt05xRMBvPQAcwmLZTXgS3zYVJGqmYoqt
         CckQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726052565; x=1726657365;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+hEGSpMBn03EiNQyLgug6eukNiwXd245jyNa4Wj3sFs=;
        b=s9S20SquHq3GhFHMP9Qi1VjKTLn7nnNpLXfZ/PKZOsOK1cKMqm0hbBF2ZX+b0g7Hln
         oe8MMEDz5leioAvMxZTmEo1bBRIzPbTmDXhaRQ+YSRqMLQcFKtf61/qJwjzZfuoCn3ml
         2++e6m2KBEWERfVGnJK5ZJsNmX2U+N3Zs8lBCGcjnS2oQaitKRY5emWxsNfFmhJRigjJ
         Gj+MASQwneJTipymhqVsm4GIzhA7xJjB5jaqO1mbyv3nnisAF8/WqFJbS3V0QpjfmC9C
         SplYVLxTE7GvaFvavX6X2uB48GA2ctg9OsdK6JoVoOGuTTcw8CU9/mJxlBKsvY1ZsnEO
         zKAg==
X-Gm-Message-State: AOJu0YyzsTFvUUno/f9fAv6ZR33xTjM7J9BWNn8JYI+z6D7+FWYTpDeb
	sgkr85Djf9/cAQdHd4FUzclOABa/1X60z0mdq8zlufPOwS1mlaSNjFeszzeJgnQ=
X-Google-Smtp-Source: AGHT+IHACZIwOwq+f0aS4HzbHBARjqHyPnp9kNKWRzX5FkzID8GnITaOsxQGxqiE2TTNkdPeGRxvXQ==
X-Received: by 2002:a5d:6945:0:b0:374:b24e:d2bf with SMTP id ffacd0b85a97d-378895d46c9mr11736453f8f.27.1726052564812;
        Wed, 11 Sep 2024 04:02:44 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956652e8sm11448115f8f.30.2024.09.11.04.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 04:02:44 -0700 (PDT)
Date: Wed, 11 Sep 2024 14:02:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: linux-mediatek@lists.infradead.org
Subject: [bug report] drm/mediatek: Add mbox_free_channel in
 mtk_drm_crtc_destroy
Message-ID: <77b85cdc-ecfe-42c7-a3f3-a757566b6f5f@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_040247_983174_4A8300D6 
X-CRM114-Status: UNSURE (   6.06  )
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

Hello jason-jh.lin,

Commit 593b655f0523 ("drm/mediatek: Add mbox_free_channel in
mtk_drm_crtc_destroy") from Oct 28, 2021 (linux-next), leads to the
following Smatch static checker warning:

	drivers/gpu/drm/mediatek/mtk_crtc.c:132 mtk_crtc_destroy()
	warn: variable dereferenced before check 'mtk_crtc->cmdq_client.chan' (see line 130)

drivers/gpu/drm/mediatek/mtk_crtc.c
    123 static void mtk_crtc_destroy(struct drm_crtc *crtc)
    124 {
    125         struct mtk_crtc *mtk_crtc = to_mtk_crtc(crtc);
    126         int i;
    127 
    128         mtk_mutex_put(mtk_crtc->mutex);
    129 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
    130         cmdq_pkt_destroy(&mtk_crtc->cmdq_client, &mtk_crtc->cmdq_handle);
                                 ^^^^^^^^^^^^^^^^^^^^^^
Dereferenced without checking.  We recently refactored these so the dereference
is detectable by static analysis.

    131 
--> 132         if (mtk_crtc->cmdq_client.chan) {
                    ^^^^^^^^^^^^^^^^^^^^^^^^^^
Checked too late.

    133                 mbox_free_channel(mtk_crtc->cmdq_client.chan);
    134                 mtk_crtc->cmdq_client.chan = NULL;
    135         }
    136 #endif
    137 
    138         for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
    139                 struct mtk_ddp_comp *comp;
    140 
    141                 comp = mtk_crtc->ddp_comp[i];
    142                 mtk_ddp_comp_unregister_vblank_cb(comp);
    143         }
    144 
    145         drm_crtc_cleanup(crtc);
    146 }

regards,
dan carpenter

