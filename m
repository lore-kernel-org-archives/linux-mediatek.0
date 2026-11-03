Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C85C606A32D
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2026 04:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uiyKHC6S;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=drQu132S;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=CeMndGP1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=MIuVuN5S3A1ntm2yRRAwtrIs+TTbfraz8EmH2Z12duY=; b=uiyKHC6SrVvKaF
	oxqx0x468IAmWFsFhbXgFfzljKQpfjtdya0Cp/nxQ60rlj7v7CpvF+CRZh3js4QC4p2V1QpuiY5k4
	+ZWuTKpJXgRnXYkdLcjkomKtSiW5xugYPWNUIyWFEKhU/1dYcgeKnY2bvVqJYAcBsaWVsMzDcETYL
	siLFnuzXcwC9rwNoAf/D3PINTZjRlC9phmEnMr6nsVighoTHd1shN3luKgZkQDCT8jc4YF1pMVBZa
	E+BegnnF7AAL7yiregtpOdD80Cf2E1Ihr9RPR5TvT31dLUPmy3lHIw1XgMbdUaXn32ArkrmkGvgRF
	0CM5bNtw+wzNcLsZm7QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO6Hq-0000000141H-0TsO;
	Tue, 03 Nov 2026 04:38:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO6Ho-000000013xb-0une
	for linux-mediatek@bombadil.infradead.org;
	Tue, 03 Nov 2026 04:38:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=MIuVuN5S3A1ntm2yRRAwtrIs+TTbfraz8EmH2Z12duY=; b=drQu132ShhsqlPTCigWNGSYmR1
	Vu/b8kr93n7utbgtKj2p4nIa8nacGkm67rjwGlHT4k0EnOUre+TuRm6F0H+oX42mqVAu+z9PDDETy
	HEjiX+/MHAKjgJ6oXj85hY/BPJ7pLnAMy8/HQdt1kwhJMGOSZczRfKRajeFd1O+JQwKFdtAju2Xqn
	KJpy5wtjAaRAAFsg1m5pTE3ByXDK4iuWK/vHewpNoY8ICLrsxMallTJ8pa2YGqGxMvpC6kVzZE02l
	j+1qqOb83C28TO9zuLTNbYpJhxSw6r+F8Tc6JmDJ0S8wac67p4jTlWN3HddaBi8o3l8oGM7IJxG1j
	+D0Zavwg==;
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO6Hl-000000001Af-1qvS
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Nov 2026 04:38:15 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-3ac7c7b3a90so1628723a91.3
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Nov 2026 20:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793680690; x=1794285490; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MIuVuN5S3A1ntm2yRRAwtrIs+TTbfraz8EmH2Z12duY=;
        b=CeMndGP1WDemGwmVlf3diEZfAThF2vAVLRic/1K3Jt/fwKAGuF/nW4AnCJzNOEENvC
         BmuTrziVhwOXX67snIBJ9IBgpPWAaLAouKa1rZGTi/FcaRYVrceQa73DBddbIiFagd8w
         tYWT/x+3Hf2YZ9r1RKKgrR58+EdAeT8izgQmY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793680690; x=1794285490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MIuVuN5S3A1ntm2yRRAwtrIs+TTbfraz8EmH2Z12duY=;
        b=bbibjvsDBgnAfBemnqWNLbQ8b8qOcCgix+naiQ6K9JgLBhkpn5PEbct/ER7Kgt2Mvw
         hmJXxLIew+tfDj50IbTLbcWMfnm8rr78mOno4tUR0zc/vjYBHBsWODcdoL0biYaE7LF9
         ctvi1GoSR4WOhVfws0owsn8PWj1gjhjT14KIatWCDPy+y0PQ3YjB7qq1x825i9ABBogx
         8BaPdSqU3MZlqpfQ+uBJfJ4DFr7mIIoAoT23dedJhkvvA6gKzNYbO2i1pCwJ7xLwDPk+
         JVK2O9SCA332dz1Li7olyDHgEHJpKTy8VX0wt29/iE76/g9o93YdJ//zjqL44cN+8bVI
         ZuLw==
X-Forwarded-Encrypted: i=1; AKwUvBxgamVuGQdTxj6AcLWzHV3idAc6+Hos2nSRSDAcEuO7CEClQzPaY2dyNlIG/YiP9UscIf/DBodUSQ2E2xS6XA==@lists.infradead.org
X-Gm-Message-State: APuU4Z8jeC2svonMKD1HnpYGTf5D/g3sYugUBuTQI0jTAMTqodUWbMYs
	dVlNVJfPL2W2BW9F0z1YV/0JFbEnnEto73HaVBOngJDXruxzzD/2+zrja9QQ0KjxHQ==
X-Gm-Gg: AYBFou1FzOUsMc2eCsEGz7qDhPz+I541OMnE+k5+nfOsUm6wyyRpAh0btX2QCV6HLEc
	icRwa4r4GtKtkR6A57Nx+q08B2ESZMGSsZRwp+T9tER9A6xnph6yJgNrDBDFfa0p5I9pNQ+H1b+
	fOK0UTlojwzcYu9YkqPw75y9vZSxcWB0fzMOUf62l9RDnO3AYSMbDrhIv/4J7tLT1JyqSdXa0Jt
	Dfa6hRHjzsBaVgLuI9lqNwuvm80GQxxRYyBjorddH2M3CrgDQYHApED3jgVy76lbrB5Dk2+JMzR
	6KZ7pyzPEg5i0Zhhs+h7MEf5NO6vMjsILFyWadHya80Zv5YcSpbsfEw2RP7MGfOMEL6YnXTjXYl
	A8hBzaxEESu7f61IzWH1QIhVWt4GU8NHuBT5AnlufLfvF9Hoo5cOuIWx55FCfFyRPrlqq84B38H
	7PV4ikr58xk3UtIsFRcWzWrWzL8+YCSPIn5XysdcM8j6sXNHPEsk2s5AAIWyHtDvMbL/Fde0g83
	+0bM8c5ELQBYxqej0GH7ZvhDPQxn5Q0p9P4Cx/7qzlCgeb2enhN+7E/+kxG2NkxQ+ItnC14pZ5y
	VFG0ybJF4rGYE/455fqBQ4XxX44uvO2DM+7mLEaX4qoDYtavvt8jmIWwk/Vm8MLBG6Vhdobu72i
	SkrJ7LicBguc+
X-Received: by 2002:a17:90a:5d17:b0:3ae:898e:a123 with SMTP id 98e67ed59e1d1-3ae898ea1b4mr7369616a91.14.1793680690189;
        Mon, 02 Nov 2026 20:38:10 -0800 (PST)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:dea6:6326:4502:bb8b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c71c253sm2072761a91.16.2026.11.02.20.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:38:09 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 6/8] i2c: of-prober: Defer regulator_disable() on successful probe in simple helper
Date: Tue,  3 Nov 2026 12:37:30 +0800
Message-ID: <20261103043734.2179858-7-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <20261103043734.2179858-1-wenst@chromium.org>
References: <20261103043734.2179858-1-wenst@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_043813_388139_B9E7981C 
X-CRM114-Status: GOOD (  22.04  )
X-Spam-Score: -0.2 (/)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When a I2C component is found, its device node is immediately enabled.
This triggers device creation and driver binding. The prober will hold
the regulator enable reference across this part. If the driver probes
synchronously, then it happens within this window. On the other hand,
if the driver probes asynchronously, there is a high chance that it
happens after the prober's cleanup function was called, in which case
the regulator would have been disabled when the driver's probe function
is called. This would then require the driver to wait 100 ms for the
hardware to reinitialize, even if the probe function was just a split
second late and the regulator was disabled a few milliseconds ago.

Recently, some of the drivers for the components that are targeted by the
I2C OF component prober gained the ability to skip waiting for hardware
initialization if the regulator was left enabled. This happens when the
PMIC has them on by default, or if the component prober left them on
after probing the component.

Tests on the Hana Chromebook showed that if the prober and trackpad
drivers are both builtin, then the time between the prober enabling the
device node and the trackpad driver asynchronously probing is between
5 ms and 30 ms, though sometimes there are outliers exceeding 100 ms.

Wait 100 ms before dropping the enable refcount on our end so that the
actual driver has the opportunity to catch and increase the refcount on
their end.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v6:
- Fixed typo in commit message
Changes since v5:
- Only defer regulator disable if a device was found
Changes since v3:
- Added commit message section showing average delay needed
---
 drivers/i2c/i2c-core-of-prober.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/i2c-core-of-prober.c b/drivers/i2c/i2c-core-of-prober.c
index 97ef58bb4c04..f52ab3f54933 100644
--- a/drivers/i2c/i2c-core-of-prober.c
+++ b/drivers/i2c/i2c-core-of-prober.c
@@ -238,11 +238,23 @@ static int i2c_of_probe_simple_enable_regulator(struct device *dev, struct i2c_o
 	return 0;
 }
 
-static void i2c_of_probe_simple_disable_regulator(struct device *dev, struct i2c_of_probe_simple_ctx *ctx)
+static void i2c_of_probe_simple_disable_regulator(struct device *dev,
+						  struct i2c_of_probe_simple_ctx *ctx,
+						  bool defer_disable)
 {
 	if (!ctx->supply)
 		return;
 
+	/*
+	 * Wait a bit of time for async drivers to probe and increase the
+	 * regulator enable count. This allows the drivers to check and
+	 * skip waiting for re-initialization.
+	 */
+	if (defer_disable) {
+		dev_dbg(dev, "Deferring regulator disable\n");
+		msleep(100);
+	}
+
 	dev_dbg(dev, "Disabling regulator supply \"%s\"\n", ctx->opts->supply_name);
 
 	regulator_disable(ctx->supply);
@@ -359,7 +371,7 @@ int i2c_of_probe_simple_enable(struct device *dev, struct device_node *bus_node,
 	return 0;
 
 out_disable_regulator:
-	i2c_of_probe_simple_disable_regulator(dev, ctx);
+	i2c_of_probe_simple_disable_regulator(dev, ctx, false);
 out_put_gpiod:
 	i2c_of_probe_simple_put_gpiod(ctx);
 out_put_supply:
@@ -405,7 +417,8 @@ void i2c_of_probe_simple_cleanup(struct device *dev, void *data, bool device_ena
 	i2c_of_probe_simple_disable_gpio(dev, ctx);
 	i2c_of_probe_simple_put_gpiod(ctx);
 
-	i2c_of_probe_simple_disable_regulator(dev, ctx);
+	/* defer regulator disable if another device driver could enable it in time */
+	i2c_of_probe_simple_disable_regulator(dev, ctx, device_enabled);
 	i2c_of_probe_simple_put_supply(ctx);
 }
 EXPORT_SYMBOL_NS_GPL(i2c_of_probe_simple_cleanup, "I2C_OF_PROBER");
-- 
2.56.0.385.gac671c819a-goog


