Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB2B9C05052
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Aug 2023 10:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z9lhOsL9u2m/0CCpIqf7Y1Re49YhKns/kxGsCRmuFFg=; b=cBg41x+1Wd+6qYQMfF1VXfTHL2
	EErCeIFyaGJE920+d7R4tTDPqANQgu16rolCrFMaStZDnxtpnf4JstUuL4ORh/6l4v0rRtJ8tzF0E
	Yv28wnfPCFVE4dtvLMmisVzxBUzwjcCb03vpN7axWCzrLV/gKlKn3BeCi769C94DuZ72B/hZSjIYp
	T3iMydk9/Af2kwkO25nIbSlD280h2vpe7xzl7sSlzrrxtQusIYDOXVPFRBZ+gWOhM9lX7NbAVJqmq
	9AUWC9uf/Qfn2xfI2uTdjyre/1WX+XrWLYfEvc1CMzF74e5E7HtxTBHs03pVDlmYeV/6NtqSrywvv
	HcsU+0vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWwj5-008ENR-1j;
	Fri, 18 Aug 2023 10:29:07 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWwj2-008EL9-24
	for linux-mediatek@lists.infradead.org;
	Fri, 18 Aug 2023 10:29:06 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4ff8cf11b90so1098857e87.1
        for <linux-mediatek@lists.infradead.org>; Fri, 18 Aug 2023 03:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692354542; x=1692959342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z9lhOsL9u2m/0CCpIqf7Y1Re49YhKns/kxGsCRmuFFg=;
        b=Nk6lY/sji1554KDrGzAZ+vjyXmGCo042ElgTPya1gKwgEeUMJIcdq/wL5qfJOk4V6r
         QpUtBXig489jzJ+hQHTfCcgZU7XF9+yuaQMzyuQk8iZDjOikQiIfZPwoK0Wg/COQrxl9
         tst75NqToCwol8oi2fiM6+jxiNJKAd1RLZH3SeN+pBuIuKH/WuKDnSXySgnPRpO5W/nb
         PPFXaNQ0Lf/DUU/JfkmOr6zu49ydwb49B3UEb+1l9Tdp03W7hGXDylEcrHtOjmw/+PJj
         v6/iWoWcPIdSZfJBq2lglvRE39FwKzxVyKCNINBSk3RSKBjQ8EqABkiisBSTpwTrZ7hk
         QKyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692354542; x=1692959342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z9lhOsL9u2m/0CCpIqf7Y1Re49YhKns/kxGsCRmuFFg=;
        b=Il02Mto7bBFb2IqW9gVtdVEJ+kvVkVKPZLbEHO/pJj13RT0PIeQhsnU6PoUFhNRP7h
         LeBb3izkFEgMrSBn8qcqt0fI1cR12AysssJ437vGQiReogCKedBaUPMf7xhL3OAzxBcb
         3XP0nIyN0m7Jm/hT/f2uOpHv3NFw67x4fApjnpziihcJrFZM6C9Wf9hZdEW4FCbzQ5Fl
         N7cgt7xB3RaSltNaNLW3JJxqtOGDtnCAWlHeAprLsu2jCG41YGz9RpaK3uWZs8Oo5Cyn
         2Cbu9NksHJ7sdoZWhMlzwo6Oz/n8TNUesAGcffgdklJ7/WXEA6MfB7Qh7/V/sm6tK8GL
         jd0w==
X-Gm-Message-State: AOJu0Yx0upfHEb68DsKAvpAalx7r0KjD21UDaBOgF9I7C7lWQbM9+BHc
	J8I44LZoLF25nu6tB+/s1zYpHg==
X-Google-Smtp-Source: AGHT+IF40zslK9J+qU/URMrIBd2SvGHNIaxIqpROmnBlnsAtbhU8eCxr4zTdpXbQVvv4xnV2w+38qw==
X-Received: by 2002:a05:6512:3613:b0:4fe:347c:874b with SMTP id f19-20020a056512361300b004fe347c874bmr1333211lfs.8.1692354541864;
        Fri, 18 Aug 2023 03:29:01 -0700 (PDT)
Received: from 1.. ([79.115.63.195])
        by smtp.gmail.com with ESMTPSA id h6-20020a1ccc06000000b003fe8b249df1sm2338909wmb.41.2023.08.18.03.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Aug 2023 03:29:01 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Li Zetao <lizetao1@huawei.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	alexandre.torgue@foss.st.com,
	angelogioacchino.delregno@collabora.com,
	christophe.kerello@foss.st.com,
	christophe.leroy@csgroup.eu,
	dmitry.torokhov@gmail.com,
	frank.li@vivo.com,
	geert+renesas@glider.be,
	heiko@sntech.de,
	jernej.skrabec@gmail.com,
	jinpu.wang@ionos.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-mtd@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	martin.blumenstingl@googlemail.com,
	matthias.bgg@gmail.com,
	mcoquelin.stm32@gmail.com,
	michael@walle.cc,
	michal.simek@amd.com,
	miquel.raynal@bootlin.com,
	nicolas.ferre@microchip.com,
	paul@crapouillou.net,
	philmd@linaro.org,
	pratyush@kernel.org,
	richard@nod.at,
	robh@kernel.org,
	rogerq@kernel.org,
	samuel@sholland.org,
	stefan@agner.ch,
	u.kleine-koenig@pengutronix.de,
	vigneshr@ti.com,
	vz@mleia.com,
	wens@csie.org,
	yangyingliang@huawei.com
Subject: (subset) [PATCH -next v2 00/12] mtd: Use devm_clk_get_*() helper function to simplify the drivers.
Date: Fri, 18 Aug 2023 13:28:15 +0300
Message-Id: <169235440227.51486.16999366988462758608.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230818074642.308166-1-lizetao1@huawei.com>
References: <20230817024509.3951629-1-lizetao1@huawei.com> <20230818074642.308166-1-lizetao1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=1031; i=tudor.ambarus@linaro.org; h=from:subject:message-id; bh=qpBLrC/ilH/3fBZL7I10FOtEch8tT5TWABqedTkdJLw=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBk30e9B36HHQiy8MTzJoUhZP19kuOAqlZ0xMr5A nGWgVSVIACJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZN9HvQAKCRBLVU9HpY0U 6SA9B/0bzJF2vkTay6CKZ3yxN1Qxor783Yen8TkIj1p7DKify7NmufB/YhIAWBjfBO4GpRl13s1 CjdOosz5zEZROL6X8tTpfxeSh0ND9LdnrAnUT73t4Zv6LpZfSmi2ACGdM9kOJUDj/ZTBM+5Vpw8 OwaqfV4pf0E4kSxStDENPPGV7HnolpkQjZhotKlZrd/RaLGKpZFuaVUWI4Va5Xia8dG/MvFoH69 jLFs6mGZGvoduGY6IeDSwIZT8c5gf8WhwlIqvXsLbhvF4ep9M6Y/VJTrx6ENfbLPoIYhkdDVILi eIdzLGW6/Qtz25I001dRDfNw7EKpXDe4XBsZKwnIrRmkMkAV
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_032904_686758_91855915 
X-CRM114-Status: GOOD (  10.81  )
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

On Fri, 18 Aug 2023 15:46:30 +0800, Li Zetao wrote:
> Commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for prepared
> and enabled clocks") provides a new helper function for prepared and
> enabled clocks when a driver keeps a clock prepared (or enabled) during
> the whole lifetime of the driver. So where drivers get clocks and enable
> them immediately, it can be combined into a single function
> devm_clk_get_*(). Moreover, the unprepare and disable function
> has been registered to devm_clk_state, and before devm_clk_state is
> released, the clocks will be unprepareed and disable, so it is unnecessary
> to unprepare and disable clock explicitly when remove drivers or in the
> error handling path.
> 
> [...]

Applied to git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git,
spi-nor/next branch. Thanks!

[11/12] mtd: spi-nor: nxp-spifi: Use helper function devm_clk_get_enabled()
        https://git.kernel.org/mtd/c/69d50d0461a1

Cheers,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

