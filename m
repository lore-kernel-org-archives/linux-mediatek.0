Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54999606A326
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2026 04:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1z4W2kGT;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y3gBZgFS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GcfSxz5aPzlv2aH/G/YIDcSJdDCU+Fm7JWkQ7b1zh2Q=; b=1z4W2kGT9HH+N8
	H7P//4fNBNmefFdJUvBpu1OlsZHIt5hl9MK8EtvpTJNVeHVMjvFo0PzcxTukxhLoJBRgLkO94d3LL
	mp9ovFeVYmq1sZ/q2pb10Y2aubZRVWaXKQBwwXXsipQ4uMnzJaBIRylI0qZ424Ua9cIsJK6Mudy9R
	tr3W4WmY3kskLf6hccQmG+Fg9iq6FaqH4Hy5WSoj3QIAivGOZkKX6nzX/fx/VNn1+ANVnBtaIIxk4
	aE8AIi6+bLoL5eP/sERJrGBWI8xrEr4vWstZmMIL9jtTiltWWIIoWnNGxpkNKMaAt1FwKISEUbTRr
	FygV+XWSDNq1C99tMwaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQHDR-0000000HKxd-0G6V;
	Mon, 09 Nov 2026 04:42:45 +0000
Received: from mail-dy1-x1336.google.com ([2607:f8b0:4864:20::1336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQHDN-0000000HKwS-3gLs
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Nov 2026 04:42:44 +0000
Received: by mail-dy1-x1336.google.com with SMTP id 5a478bee46e88-36f8cdd30beso1130208eec.1
        for <linux-mediatek@lists.infradead.org>; Sun, 08 Nov 2026 20:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794199361; x=1794804161; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GcfSxz5aPzlv2aH/G/YIDcSJdDCU+Fm7JWkQ7b1zh2Q=;
        b=y3gBZgFSO8BT2F8jFMkHnSx/cwPaPebQOQrN6dPxbfz9/s2Ujnh4vWqZl0KDdgFcHi
         WJMlaMnivFKP9Eng1MxAx6+UKFfsId9Fqf1sygr+/lruo1T66kFNkyYJizvqexDll6ED
         Ce7hf9sPJAyR0sVZ1rOZCXYLQp77Kf6sKjRopdkrCR4Cy30E2sUC3x1ISfeFjJ3dnzPg
         sxCHm7qAb7XSWEDFbqFyP7AhhPkby419Bwvcr3l0GXDyNHuqx4jeuTQucH9fXVNqNIRO
         po/M7WG6svNnBzh5m3zV7tNI6LL9jerRYo5DKup2/QhpUY2jLWhduBqfAWkGmXpuB5EB
         2eZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794199361; x=1794804161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GcfSxz5aPzlv2aH/G/YIDcSJdDCU+Fm7JWkQ7b1zh2Q=;
        b=jOSHqBW4uUY8y77jhA97F0AQXvbdRw1I9NQTaqDzpMspNePLoIoZgwOrh47/DzYLR0
         7NG4b/fs8FiqLcYk47Xze9ZA5vR+E16/Im/O9q8yNu4I9ghOjlrPHeEqeYdtDGEDmNu1
         bzml4gHc+jgsCkjdjB9C7oHSYK8GCF+w9goeygjv6d+WF7Ew9Scv8W4th8XilNHfAibg
         c8VkwAYSykSnOw0Jz4KcMEoO4Mhr0QWqEh/EZ56i1qmPhpLT6sAkApnpFIPxunLhz8Y3
         3gCTjdNOrKAbedaieHEgxrXYNg4BPWzluyP/pYb7VCAkmxrqy4FD/D0K3PL61kz2MrcJ
         hMHg==
X-Forwarded-Encrypted: i=1; AL+hErGSI2+fy4d6Ipui1wBE7tYqWflwxxpebQh0YHSZU0xRpOn5MxPwKFNyuEo7UFXvHSxzSGUGiGDujUHRc9PrOw==@lists.infradead.org
X-Gm-Message-State: APuU4Z/nK9iSBuPzfgtCcrzl316jisE3wEvJH5Zf1eN8VYF1L0h7Fv6V
	pivCiHNecf3TYcBafoDPDZUiaxTndLBh5xYFOQR+AV5grAwC4120aog9
X-Gm-Gg: AYBFou0mBYxMU4kwjLv/uk46lIY84oq8aoTOqml0BVgQ6zWzWM7m7305UGubZjUjuQt
	tvuH8tve4YqLWIuEBr2h7ZVhFVvxN36oz+xHrxu72M04tPaLAr2/4kGlZ/qByCg+hGYcLrwLQEM
	671ymlPiZ5eHW+v37BgV97R6hVXbDzNcQ0MstADGuRPjJ0etC8cEDB5NO4APGkk6pIC1MjK1u09
	Ut6hDYst/bHLqPVvbeotQNOD2l10Vixli34BlwOn/59LZQMteUjXt5N66MXPCq0SLWImtzbSd1W
	MKmkfc2unSCvq2EOvNv7Q+GdC7NL7L6jdVUpP38flm6ktqdci+zEDsO24j4mqZHmBGHDMRhfYyo
	PFOiJ3Xa02iMRb0RLr6B2mEECmCZcnFpZgg7S3vpjwvuQRNt6b953hp8r5rrum09yQC6PvUggzy
	YCuaRxe1/DcvaXolj/E1NcgBKf8eOJZrwDfAtdHJADU3/gAud8XEhh87TptSdZASibSMsDDUe5g
	5aqhDV8cyIlnkQGWOkct8kj9SAKgNYxCd3foxLZye1Fi3j+lJ5eNClUuO7S51Sk0Yli+8VC39Ce
	DMmKqj/u3giyU48GcPXTfAwCZPqhzxc+KgPOVij7kygLEK9l
X-Received: by 2002:a05:7300:1c0b:b0:366:2893:7421 with SMTP id 5a478bee46e88-3725d77d5a3mr5516181eec.10.1794199361082;
        Sun, 08 Nov 2026 20:42:41 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3726561851esm10154026eec.4.2026.11.08.20.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 20:42:40 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Sebastian Reichel <sre@kernel.org>,
	linux-pm@vger.kernel.org
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/3] power: supply: ltc2941: drain poll work before unregistering the supply
Date: Mon,  9 Nov 2026 13:42:10 +0900
Message-ID: <20261109044212.1157357-2-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109044212.1157357-1-hj351016@gmail.com>
References: <20261109044212.1157357-1-hj351016@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_204241_918385_B4B0AB76 
X-CRM114-Status: UNSURE (   9.94  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Hyunjung Ko <hj351016@gmail.com>

ltc294x_i2c_probe() registers the poll work for devm cancellation before
devm_power_supply_register(). devres unwinds in reverse, so on unbind the
power supply is freed first and the work cancelled last. ltc294x_work()
re-queues itself and calls power_supply_changed(info->supply), so a poll
instance running in that window dereferences the freed supply.

Register the work cancellation after the power supply so devres drains it
first. Nothing queues the work before the schedule_delayed_work() that
follows, so the move is safe.

Fixes: 6d0c5de2fd84 ("power: supply: Clean-up few drivers by using managed work init")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
diff --git a/drivers/power/supply/ltc2941-battery-gauge.c b/drivers/power/supply/ltc2941-battery-gauge.c
index 6ebb555..8f8a8f6 100644
--- a/drivers/power/supply/ltc2941-battery-gauge.c
+++ b/drivers/power/supply/ltc2941-battery-gauge.c
@@ -531,11 +531,6 @@ static int ltc294x_i2c_probe(struct i2c_client *client)
 
 	psy_cfg.drv_data = info;
 
-	ret = devm_delayed_work_autocancel(&client->dev, &info->work,
-					   ltc294x_work);
-	if (ret)
-		return ret;
-
 	ret = ltc294x_reset(info, prescaler_exp);
 	if (ret < 0)
 		return dev_err_probe(&client->dev, ret,
@@ -547,6 +542,11 @@ static int ltc294x_i2c_probe(struct i2c_client *client)
 		return dev_err_probe(&client->dev, PTR_ERR(info->supply),
 			"failed to register ltc2941\n");
 
+	ret = devm_delayed_work_autocancel(&client->dev, &info->work,
+					   ltc294x_work);
+	if (ret)
+		return ret;
+
 	schedule_delayed_work(&info->work, LTC294X_WORK_DELAY * HZ);
 
 	return 0;
-- 
2.43.0

-- 
2.43.0


