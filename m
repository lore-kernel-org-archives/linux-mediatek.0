Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47011606A324
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2026 01:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rvFEjorP;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vjeG8enD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-Type
	:References:In-Reply-To:Subject:Cc:To:From:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4QuyiSQPiIDTfEJTEpYvEBkj4Se4WoY6XU6KWrukd4U=; b=rvFEjorPMwB+fe78nU93V+3gCz
	qNbYkOMj+HdRT1eTKiZrj5xflwie5BtNCadpyrg0fY5UOxUE3ujSJ9Z0ynQiDyrVMcpH6HnSWa5L9
	8aNmAk6wUjcfk12u9E2QTNy6Vd37zRtNOCfOJqeC5BxbhDEPHZKKMKVr71WaTPVHgtYmG+vFJm2il
	jGZ+jTiMFxlvLx3R1z3TY4md+upLIf5s1HFSFuDLu/TChIlUD/380RKDUZ2SOi43ju2JUjdy0uY/j
	MsZuPqrobJf0K4pVjcOczPAo6TGmP43uC9xuCPYmV1wBSaWsLZ+HFRCj0rFs5e20+hZqk7xYJcviG
	SCLjQRHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWkXs-0000000EieB-4AoH;
	Fri, 27 Nov 2026 01:14:36 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWkXq-0000000Eidp-1BxS
	for linux-mediatek@lists.infradead.org;
	Fri, 27 Nov 2026 01:14:35 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso3810028a12.0
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Nov 2026 17:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795742073; x=1796346873; darn=lists.infradead.org;
        h=message-id:date:content-type:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4QuyiSQPiIDTfEJTEpYvEBkj4Se4WoY6XU6KWrukd4U=;
        b=vjeG8enDm8MDWaLvmCGvcMBtCVp4IIAtSM5u1Gq14twIC/S0gpcNZyFR4ml0CfFd3v
         eN+a3BPXgLUfbTTSlFdUc5sOEw/+DRfYIov8U5jhaWrOkihAgHYKo9rKbXuNqNPbaoXI
         +drf9YnDkkiHC6DuBAH6unsv5+maf5EyFk7wvvAwIzdOc1REKJNUHEyvMz4ZFPKvmu/v
         voAZPu0v2SZy7kUKg4S9zFR7GeWJ04GZBUtEHXbYczfNOSZ4NEUigbTqGgw23GTjrySb
         DiBWVwocpbdUi2MRMzFTjYV7wQq7xUdc06rGSyPGa8pQTqIGhxkTBwbAlKrHH8zD2yo2
         il1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795742073; x=1796346873;
        h=message-id:date:content-type:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4QuyiSQPiIDTfEJTEpYvEBkj4Se4WoY6XU6KWrukd4U=;
        b=M6GIJbG2j8eOCByyyZklHwTSIUgppo9WXAFObBIvx/yHq9OeQBvKtkQwgD+SfbRy5L
         /CVCsWIe6dpFt7Euv1rZ67cV8cc/aIR9XuyupkZgmpzbTHEtP+9uOwIK9IJI4TfA/Pt6
         RL2yg9o9wVETVGRXpvALrdm3XadVTNdwcuVkG+ig3B4xWTPqyDFQquqjHL643oMqwn6E
         pqqTHrOUAh1lsJUDwUGgKWJDRzin7UuKUSVW4+S+9oSq/tZPAjAXWFcyvnkb6GmmrpHV
         cEJTfhVtevxxLxv7uzwMUJLRGazUjZlB/SQtTrYbAkzQFVMW4kIGF1UYRVL2E3g7bwjF
         FIGA==
X-Forwarded-Encrypted: i=1; AL+hErGnj4+8DXxkr8jD7hzVr/T5C9qGMHbKMvVEhJBqSIsWO6dzRgGtcqAUUIcM9GeJoJTXpMgPE4z9NcORpvmo7A==@lists.infradead.org
X-Gm-Message-State: APuU4Z/aGXbCQ+r3t3JNJn0kWC9mB8daSefFS/6jbs8kap3SrFNpOsd7
	XIBSR2R+my8qf441NZ7TNokjTLLI4J4pEvNk9vBYyuMENw5zcfsYVyWI9rGWFdWwq06yaQmE
X-Gm-Gg: AZFdTZftWUshQV3eaTfjVIYijv3zk5P5vwvbCkv7xaKRcVmFRZ4q3GLL8l8XmLIADd0
	3ZZbZVCjx4blBXkuJWKBR/sRpPOjn9KV8JZ9MY17nJNsFxu/6PvVY/boIKRroRNOzuTZFLsEEeZ
	ZMZymmPS4GVHuc+AL1mT8eLTG7EfeYTaOqY/5ItEVMmudOhG8KkbzECHq/JfCUdUmtnMrIQXJOZ
	0Fsa5dI5SUBrCITsQgepuCHRO4t/ZI7hx8PDSVDgWuFdDWUjwpzfI0sPaxY+z6ueDizKj/UVHXl
	fcF+ECV0dr2rYocpYw5a3XuDBhbXX5OvFbCaAxj50QNWAxaJo9XUvAnQxoP4yKr4lxhagz/ORfH
	ySE2iafEgfhodIWoco4OorkrUbtGz/x7uoxXeRvGLKgPLekc1z+3pqxFft+Qco/UW9XP4vLVgQb
	1K2Q4dmwTDsZVsblorouKMLR5QeLMdRhhprap4o9vUQxJJ7S4BprzIY5GEqOqgJtR4tNOCTtqat
	p9gIDV90spW54ZyXmkH57ipmvkndKeHiCp3A7HlCl0clrMIleJMp93MvsTHJ4+v96S5icfDbFGb
	uwuaRUqH0vWpIX4srDUwaUsf4j6OngG6rF78Tf7IfJ24VnOJPvsrJe12uqOxKDcLqGCdPJJty2Q
	DpI7v4qasVnACWeIpk5ek
X-Received: by 2002:a17:90b:1a90:b0:3b0:9941:8d42 with SMTP id 98e67ed59e1d1-3b41c92a1c0mr20960400a91.33.1795742073166;
        Thu, 26 Nov 2026 17:14:33 -0800 (PST)
Received: from mac.lan (114-45-165-38.dynamic-ip.hinet.net. [114.45.165.38])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b2c4sm35005235a91.4.2026.11.26.17.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 17:14:32 -0800 (PST)
From: Ilia Snezhkov <iasnezhkov@gmail.com>
To: Peter Wang <peter.wang@mediatek.com>
Cc: stanley.chu@mediatek.com, martin.petersen@oracle.com,
 James.Bottomley@HansenPartnership.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, louisalexis.eyraud@collabora.com,
 linux-scsi@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] scsi: ufs: mediatek: round scalable clock bounds
 to clk_round_rate()
In-Reply-To: <00ba0aec941a72c8401eab7c3d4036caa2ae8aee.camel@mediatek.com>
References: <20261126031008.27506-1-iasnezhkov@gmail.com>
 <20261126031008.27506-4-iasnezhkov@gmail.com>
 <00ba0aec941a72c8401eab7c3d4036caa2ae8aee.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Nov 2026 09:14:28 +0800
Message-ID: <179574206826.56397.7920531590189565888@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_171434_350184_E697776E 
X-CRM114-Status: UNSURE (   5.14  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 2.2 (++)
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
X-Spam-Status: No, score=-1.9 required=3.0 tests=BAYES_00,CTE_8BIT_MISMATCH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Hi Peter,

It is not a missing hardware calibration — it comes directly from the
fractional-N PLL PCW quantization against the 26 MHz reference crystal
(clk26m).

On MT6789, msdcpll has pcwbits = 22 and pcwibits = 8 (14 fractional
bits, 2^14 = 16384), with VCO range 1500..3800 MHz, and ufs_sel_max_src
is msdcpll_d2 (msdcpll / 2). To target msdcpll = 384 MHz (msdcpll_d2 =
192 MHz) at postdiv = 4, VCO = 1536 MHz, so the required multiplier is:

  1536 / 26 = 768 / 13 = 59 + 1/13

Because 1/13 is a non-terminating binary fraction, no integer PCW value
can represent 384 MHz exactly in 14 fractional bits:

  pcw = 0xec4ec (967916) -> vco = 1535999512 Hz -> msdcpll = 383999878 Hz -> msdcpll_d2 = 191999939 Hz (-61 Hz)
  pcw = 0xec4ed (967917) -> vco = 1536001099 Hz -> msdcpll = 384000275 Hz -> msdcpll_d2 = 192000137 Hz (+137 Hz)

(With postdiv = 8, VCO = 3072 MHz = 26 MHz * (118 + 2/13), the closest
PCW values give 191999939 Hz and 192000038 Hz — still never exactly
192000000 Hz.)

So the CCF __mtk_pll_recalc_rate() / clk_round_rate() result for
msdcpll_d2 is deterministically 191999939 Hz, which never matches a
nominal 192000000 Hz entry in freq-table-hz under ufshcd_devfreq_target()'s
exact `freq == clki->max_freq` check.

Best regards,
Ilia

