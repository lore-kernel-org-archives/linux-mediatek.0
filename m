Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD96BC6FD1F
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Mar 2023 07:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FDmKMfZRvdGTqS2YjpCHycz2mr/bwWb55BHOr40VzVw=; b=Jc8Zm2OR+/YNNq/s4iVZGO2sWq
	2jwccZkBOq1qp9wTPb0tEI1DRrYfgqy5Pd6ow7tqJH7xIf1FgSidREbO3mcmwHclxIBZxYPbRuhtR
	M52Tv5+NDu/XRBu0/5R43v2fOvrL/Bzi6ZgUsmK2ov75y375gPKZUqkTI6el/qNElp/7EpNxE7/s5
	u0zXtvQjkRk3SvTJxiTeRUSLZLcRfxYwUEm7PJ+bsZf6MZOxw2MPKsdr9fZ4qlg+PV4j3G0HXcGwj
	+YVM+pC/q2nBmXuz7mxM6NmF5epUhtAxsE7WM3h+lIyh7qFFZawFKC2ipH/0ZBzUTv/kjUS0nUj34
	0M+k/A1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdnn3-006Acs-1R;
	Sun, 19 Mar 2023 07:49:17 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdnmy-006Ab2-22;
	Sun, 19 Mar 2023 07:49:13 +0000
Received: by mail-pj1-x1035.google.com with SMTP id e15-20020a17090ac20f00b0023d1b009f52so13428288pjt.2;
        Sun, 19 Mar 2023 00:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679212151;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FDmKMfZRvdGTqS2YjpCHycz2mr/bwWb55BHOr40VzVw=;
        b=Uikflf21LoGQOuteV4ayhUyn0iQyYz0tnQEITezuEDbBxagF83vXzoSQ3vCrCMT8pD
         0ArNozhIkVXe/LmguBr6RkFQD6eTvnXTQzkA3bkWBVehzF2gHz6l2sLMJpbMoJGDR2zr
         4ExEHmTfBxedMiFsGOanyrfjHANBOe77txws0V5IT297orfxPWMJ2V/ajSplBZYU6RXe
         hBver8mdc2F+QwYhkktPaGqL/9JS4p9OHYpfg222j2sasl2ovGNlc9EXWQrWqlsAFP0X
         AklOksJGwhnMt1tNU7Jt1454iHT7TCbU9WvdRKxVDpHTVwOZYqCBgI2h7MnabuV5Htsr
         CMXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679212151;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FDmKMfZRvdGTqS2YjpCHycz2mr/bwWb55BHOr40VzVw=;
        b=JfwU45i4tXQxwg9iDI3/lVsFGVPPLljDzrwuPqVUG498KVf20NcQjtPZxG/nXTPf7F
         L+Wl+5k/lMcJxQnTgd2M2ywzsTHX+lc8TUOdxRnIeaSLXq88y+pC5Y6AM4a4EMgtMV6I
         fkEMp+KUl3ttgM1zxeXs6MMIg32jdpDnvpfbxA+quzL/GeE5fWXIxoEjS/vMrqXtCeWG
         aVZFyHUgu7ciZVVZ8O+YWrCQIJEX/yRxTQV0QE6kw3NO46dzQZ1z/fc23iv1eXkUUBZk
         R3L8t1uZ1RgAQNwT6JdeDqivJbAH2SBwzbD9SZRYGTx+QBP333ZhWOU6Q57JaGpaQ9+q
         FNrw==
X-Gm-Message-State: AO0yUKV8IrK9LtLgj5GEghaQ4ViE0a8Cc1EUbbQ9c1lODN9ysuoINe9S
	ufcqj8SvHgffJIJkXOKCmGY=
X-Google-Smtp-Source: AK7set9r1PJM+UDP4DEy+/qi0WLwDAu/7wmKLUGtYka4LtoxDlg+mUygQBIcBw4C/Yegck7oft0XXA==
X-Received: by 2002:a17:903:4111:b0:19a:b6bf:1df6 with SMTP id r17-20020a170903411100b0019ab6bf1df6mr11472096pld.20.1679212150970;
        Sun, 19 Mar 2023 00:49:10 -0700 (PDT)
Received: from debian.me (subs03-180-214-233-29.three.co.id. [180.214.233.29])
        by smtp.gmail.com with ESMTPSA id s19-20020a170902989300b00186cf82717fsm4296616plp.165.2023.03.19.00.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Mar 2023 00:49:10 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id CEFDB10667B; Sun, 19 Mar 2023 14:49:06 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Linux MediaTek <linux-mediatek@lists.infradead.org>,
	Linux LEDs <linux-leds@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	ChiaEn Wu <chiaen_wu@richtek.com>,
	Lee Jones <lee@kernel.org>,
	ChiYuan Huang <cy_huang@richtek.com>
Subject: [PATCH 0/3] Documentation fixes for MT6370 RGB
Date: Sun, 19 Mar 2023 14:49:00 +0700
Message-Id: <20230319074903.13075-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=620; i=bagasdotme@gmail.com; h=from:subject; bh=INgo8UAcDlgThAL83Kqu0+jtw7xGVPRobpAiN6s6OPE=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDCli+/KWz13l1TR9qpjWxwrxNVF3P7xi1kqbsnxZbuQU/ t0H+Gr/dpSyMIhxMciKKbJMSuRrOr3LSORC+1pHmDmsTCBDGLg4BWAi7PMYGZ5P3/v54+sWyw43 no6o6cs/vv3BWP687JJo7ZlDVUXKWusZGf6KGyvNqWvS01j+QWvW5WM+PlYnpV2nH9q/51aYTXL 5DDYA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230319_004912_676016_1C399635 
X-CRM114-Status: UNSURE (   7.83  )
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

kernel test robot recently reported htmldocs warnings on documentation
for MT6370 RGB LED. So here are the fixes.

Bagas Sanjaya (3):
  Documentation: leds: Add MT6370 doc to the toctree
  Documentation: leds: MT6370: Properly wrap hw_pattern chart
  Documentation: leds: MT6370: Use bullet lists for timing variables

 Documentation/leds/index.rst           |  1 +
 Documentation/leds/leds-mt6370-rgb.rst | 42 +++++++++++++-------------
 2 files changed, 22 insertions(+), 21 deletions(-)


base-commit: 4ba9df04b7ac66d2d000ed7ae2d8136302d99a57
-- 
An old man doll... just what I always wanted! - Clara


