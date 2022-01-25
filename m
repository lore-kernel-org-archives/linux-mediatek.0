Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43192C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jan 2022 16:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Qwl6ao3MfJgjaFL9tqE3WVPDLHs0QF9C5B7I1A9cZ0=; b=JlPhwQe9PSov6u
	FVt8hK00m/5H/3MYzvMtTcMUFIkGFbgjweIz/yY2AkJaEI1asy25V0KoBYS5HsfXEo2QUJX2aFBi4
	ojTl1w3fMysY7mhWXTdebTkKbuU+w4j9AKkTkvyBK5sTQM18ManrMh13MKNccAeaQkQGCa+n55dLL
	/KZp9D2zw8F4qeTlNopr3RWimNcAmmNGjJhf823TsqNHVYbBYq0xx4Tv4mlgq/26UOAx3s5ZVSdZ8
	fBUIY09+6CeFYD4XG8x5DRVOIPh0PFTqrir/GqBUnTk7mpLu5TRSZ7h8Ie+Tzbg3xBOoEi4532y0E
	RFX7G0mKcdQhxE4nv9hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCP7H-008oJk-QA; Tue, 25 Jan 2022 16:56:23 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCP7F-008oIk-AS
 for linux-mediatek@lists.infradead.org; Tue, 25 Jan 2022 16:56:22 +0000
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 892914004C
 for <linux-mediatek@lists.infradead.org>; Tue, 25 Jan 2022 16:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1643129774;
 bh=5eYae9BZCoH9A4LgUvrM4idND+AMgsOC/mtccDlQNMY=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version:Content-Type;
 b=g+ed2Wu2MHE6j33NttKTnYQAUHXYukbYhaFr+iu0TOew/PLr4caAoRfBKRo5EAszf
 GWqyBP4n4+iOvXGBfu8yYWFMv70siAVddt8icHy+FRaH4oC3kSfjZf9NPZ8UVIOdVu
 /nwZIZGlurs4uhj/ZOhgzZbmeDFkoUdXpoS00AIl5H+Zp66gpqTcMXYgTjbaUtAG2+
 77xAkuXlvUWJv92fr/zpmeIy5BzUCfMpS5n27ROd6YfzrnyMXUjO2KbfGoBH1jgT0M
 tGKKmpOz8L43MAhnEVzGlFCsofRhePz7IyW3EuK8gO+F98WGBpdV5SSuZgnFinm5u5
 augWlT724hFtA==
Received: by mail-wm1-f71.google.com with SMTP id
 c188-20020a1c35c5000000b00346a2160ea8so6443522wma.9
 for <linux-mediatek@lists.infradead.org>; Tue, 25 Jan 2022 08:56:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5eYae9BZCoH9A4LgUvrM4idND+AMgsOC/mtccDlQNMY=;
 b=dUgIDci/l1Sqdql8AMFX3EmNfD64wOD2x/4f0qbvCdhYHfxZdTRGBRCOzD0VkpEcbS
 Saz1SllR71mxocUiRAK+ouODvJJx0DZj8jbogt+9BAIt4E2h25/m1V9w8D/qA1axMRUY
 PbJakV217KmXOXlDSHUjGVBPpSQhY0msFZz2sKvuZec+2edVp0/dkc1qu05cxSRd4zhv
 bnoGw+z+GOVrkAJC/Q+NfmllHso2K82wX8K1k3IWsrSArOxsD3xnLuXHMXQKtH3Y6XKc
 BOysy4+PI1H/lvSRb2kPmOOce3LzDyA2fqfZuzEaLUnva5LX/9UferX8W2bjM/+HF9u0
 ylAg==
X-Gm-Message-State: AOAM533rE7qhwkEqGzULOLkkNkmch2vybRuYph2ZbzkYaJmKqNHi+cRr
 7Vy1w6mdwy9SkSn68FPQkz9gG/C6JsYyrEs/82+a4sguOFxxPxx7/1i0CAhs2ATzRFFYFiWTeHK
 wyH20IDkIeITworR/v7CxlOw3EyjFjmedOkVx5FDz/mdME5envA==
X-Received: by 2002:a05:6000:1447:: with SMTP id
 v7mr19423990wrx.492.1643129773875; 
 Tue, 25 Jan 2022 08:56:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyl6s7vxqqP7feCQXJb4rhGDy+l7w2eRsOoKxYvFlhqNY7yJ2EtAmgMJCoih+WZhX4X2VwszQ==
X-Received: by 2002:a05:6000:1447:: with SMTP id
 v7mr19423977wrx.492.1643129773650; 
 Tue, 25 Jan 2022 08:56:13 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id o15sm1058724wms.9.2022.01.25.08.56.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 08:56:13 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Yong Wu <yong.wu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 anan.sun@mediatek.com, youlin.pei@mediatek.com,
 srv_heupstream@mediatek.com, Tomasz Figa <tfiga@chromium.org>,
 devicetree@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 yi.kuo@mediatek.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, lc.kan@mediatek.com,
 anthony.huang@mediatek.com
Subject: Re: [PATCH v3 0/7] MT8186 SMI SUPPORT
Date: Tue, 25 Jan 2022 17:55:38 +0100
Message-Id: <164312972455.77587.5523685649094227634.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220113111057.29918-1-yong.wu@mediatek.com>
References: <20220113111057.29918-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_085621_649651_99B6F3B3 
X-CRM114-Status: GOOD (  12.44  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 13 Jan 2022 19:10:50 +0800, Yong Wu wrote:
> This patchset adds mt8186 smi support.
> mainly adds a sleep control function.
> 
> Change note:
> v3: a) Add a new binding patch for renaming "clock" to "clocks".
>     b) Reword the title for the binding patches, more detailed.
>     c) Add the sleep control error path: if err, return directly.
>        also change the log from dev_warn to dev_err.
> 
> [...]

Applied, thanks!

[1/7] dt-bindings: memory: mtk-smi: Rename clock to clocks
      commit: 5bf7fa48374eafe29dbb30448a0b0c083853583f
[2/7] dt-bindings: memory: mtk-smi: No need mediatek,larb-id for mt8167
      commit: ddc3a324889686ec9b358de20fdeec0d2668c7a8
[3/7] dt-bindings: memory: mtk-smi: Correct minItems to 2 for the gals clocks
      commit: 996ebc0e332bfb3091395f9bd286d8349a57be62
[4/7] dt-bindings: memory: mediatek: Add mt8186 support
      commit: 6d86f23c35fe7b479ceef4d3f1eef925996945fd
[5/7] memory: mtk-smi: Fix the return value for clk_bulk_prepare_enable
      commit: a6945f4566d4f77a4054720f6649ff921fe1ae64
[6/7] memory: mtk-smi: Add sleep ctrl function
      commit: 8956500e5d5bf541a945299999b0bf4866dc0daf
[7/7] memory: mtk-smi: mt8186: Add smi support
      commit: 86a010bfc73983aa8cd914f1e5f73962b0406678

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
