Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E689EC5475B
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Mar 2024 11:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QvBHCXAWkp+ub17HVIW8VAtvFSItSjV35+r++B1AoCM=; b=oyfAVfGdybqp1RvROLQluQDgIb
	iYu6tFqaddHdEnKnb/OEtFhc8jEpYf0Vbks+Rx+ILJbKgEN3t+kSU6t7lt5qT/VXG+LyDUCwcJRaX
	tETAgbDWhGpwONcctXRKQbFCammlWeMeDbQGoyysEXwNoJz/o02vpkeNH9l0MmRmW83LukZgy9uR8
	fV9I0M1Xxxp8jIaL2FrKJWBkP37IC9IBi8l+o8ls4ig7/D5etGetSCYDKbCJ2qfFGG51xkja0F5ZV
	w9hP7gw3UHQ6haQPcDu795MLwGx9yYpAMhXKAgV8GIptataPrQqkGJvu89bfBfzDzz6ZsfQELfN0X
	sEr3Dm3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg1Ae-0000000016K-2CNK;
	Fri, 01 Mar 2024 11:35:20 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg1Ab-0000000014w-0qQQ;
	Fri, 01 Mar 2024 11:35:18 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a3f3d0d2787so296194966b.3;
        Fri, 01 Mar 2024 03:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709292916; x=1709897716; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QvBHCXAWkp+ub17HVIW8VAtvFSItSjV35+r++B1AoCM=;
        b=bUCeQhdI8i9HlSnOaUfZM0iMD4t42ScJz5QZWuxekcC4Z0bsCz+bvTq0aq2JltehOK
         NGZBSIKw1EyQt+RIw7gaVn+1YEBltrnAXiMLOfZ0jIKQKy0bW9cOox76neQyPSH8bjMk
         TGFzrTHxGXkgPnsxGLQ0/gY5n2vv04Rlkh1UJTDE09oNZCs0NX15OF0raKctT9y1bcOL
         rQZ7c84z2jTiAFRgR7upHL7HO9R9gwmbleWwdB7zoS7LG8AsJLuaB0Qwcjw7xL9PiMQZ
         NuJyIZ1Bcmh7Dj/PemiryWxxKvtLp9VFATgUIHR2M/+GZ+6n6CGUKFuGcZlF29mczhKv
         Axaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709292916; x=1709897716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QvBHCXAWkp+ub17HVIW8VAtvFSItSjV35+r++B1AoCM=;
        b=J+CJUIc6ua5ynfL8KVmXRl1RqLcXfE/IUhR7xpV13DDqulLJT24RgAuNNs5+E3Gs0V
         bFkeOvQ0lRpAPA1zNCKyr5A5oBCXb0dIwS21ayxxYJtJ+BmlTjF6UsSNHjbxcPt1FPbY
         2h4beJtiJuolVq15aCLy0+mnUgWTygteilIMwUP8GPQxnmNNGWvwwyVXmX7l/9sxFoeK
         vh8BtxqnVnH7sX8T4I4Qu3Io1NKliEBH0g3IcCZvkrOsY+UBfylwYv6KpJ5nmotoIgOl
         Kxu7/cNiIU27lWs9Sl7lj9Jzv78sY0M59YbNd7pErAtNTVbYvIOLom6wbXM51NPzIvdp
         V77g==
X-Forwarded-Encrypted: i=1; AJvYcCWvmpCDp3NAWlgkLf2sZv+ouirZ0Fg5kuVdMo99AHomRfSd/EXmJ7V+iQTSMyrcelfVsBr6vM+25FfiBsaVCkyuZSGKesnnTrYQi+C/gEejdoX6Km1WWEdo6ibiukuvq2Wf+8JukWiumGQmj19nL0eH+gQGfccLniM=
X-Gm-Message-State: AOJu0YydzI0DfMSkpW0MBcGM3cD3FRPuQZ4lhSYq2H6aTGSvFSQAqcPC
	7W/yUajMJ9jTRiTNywTksNtr5R3I9JzhMySpNiM5iEdBvLWZRn+m
X-Google-Smtp-Source: AGHT+IGzLP7Sb0dwHUDkT3mh64fsZ9V0JvdBga7KakkhfMJd9QAeJRQfc5C47i6a6XnRNwidqmjWow==
X-Received: by 2002:a17:906:e211:b0:a43:fd9e:2d44 with SMTP id gf17-20020a170906e21100b00a43fd9e2d44mr1151665ejb.42.1709292913942;
        Fri, 01 Mar 2024 03:35:13 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id st11-20020a170907c08b00b00a3f5c39bf2asm1618457ejc.0.2024.03.01.03.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Mar 2024 03:35:13 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 0/4] arm64: dts: mediatek: mt7622: fix some validation errors
Date: Fri,  1 Mar 2024 12:35:02 +0100
Message-Id: <20240301113506.22944-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_033517_298727_4D65E4C4 
X-CRM114-Status: UNSURE (   8.16  )
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

From: Rafał Miłecki <rafal@milecki.pl>

One more step in cleaning up DTS for "make dtbs_check".

Rafał Miłecki (4):
  arm64: dts: mediatek: mt7622: fix clock controllers
  arm64: dts: mediatek: mt7622: fix IR nodename
  arm64: dts: mediatek: mt7622: fix ethernet controller "compatible"
  arm64: dts: mediatek: mt7622: drop "reset-names" from thermal block

 arch/arm64/boot/dts/mediatek/mt7622.dtsi | 34 ++++++++++--------------
 1 file changed, 14 insertions(+), 20 deletions(-)

-- 
2.35.3


