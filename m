Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B3A606A326
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 12:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SV6SPmsx;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a6P0WZkg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RL6+x1bK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=izXQc1m6uJs2OWW2AxpmmxzIFdzwjCtP0swelOYB4Bk=; b=SV6SPmsx3Vejr8
	qgH75HFX/MLoa7u/iZ5CkcgbZtg5oDDtq+ZdhCuHihF3TAfJO5CKDaOjG94PS43W79ohjcopF97Mg
	3vt93+ICCPgmOfhSpTxKodVfBRm2e6HgFQ+t5zK6swViL8YZAsWXDMd6WSIw9JnLSP+fDDYmkQd2a
	/fTpQGzi3U/An/4ri0KAQ5OgOyK5PIeVbAw0088s4YHNYjK/l1AmqGzh1FFsOI+0zfME9DTJ/jEpO
	Bl90E1jtb1lAnqU8H3PA1prIm+z+X6B583JBwx6aAKLl++D4U4ZSVH5NxAYpXz6+9MXGSBheDpRQy
	ejnBJItF05wvapV/L/kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlCo-00000003u7s-2CpJ;
	Tue, 10 Nov 2026 12:44:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlCi-00000003u5e-3vZK
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Nov 2026 12:44:04 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABAMmO3196464
	for <linux-mediatek@lists.infradead.org>; Tue, 10 Nov 2026 12:44:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	izXQc1m6uJs2OWW2AxpmmxzIFdzwjCtP0swelOYB4Bk=; b=a6P0WZkgTx1O2z5a
	eWvoXeu/0YND7aUSKP5NBPSFRKeZ2/KKO5D4w29QG8P3UQWrpBMkVqdskm5O5oEA
	efin8cyC/TZr0KiA18DPQXtTztS7HpioE9p2D7D+xk3B8H3WAWRJuEhXlzRAvc9R
	21XrmnF8MtzVpxfGWnCbNzzD5fXjZXsB4RQMSoTmmpvo6zMv5okZwuxJCFu7BRaF
	TNhYLXWyfh/DR2BltLc7Ehdxq6cDHTPwr+Jq0rm5XMHJsNkTXiLlYIcrWsVKqzEM
	AJoywVsm+kaFybTO1z7gRkOMQOC0+Ck8qC5FfVto1fD3jSCOheE6rdWGp/isb6Ge
	8E70FA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv03crsu5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Tue, 10 Nov 2026 12:43:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2bdebfc5so55741385a.1
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Nov 2026 04:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794314639; x=1794919439; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=izXQc1m6uJs2OWW2AxpmmxzIFdzwjCtP0swelOYB4Bk=;
        b=RL6+x1bK9GVX/+kzYzACw8MZDMfkRO1G1aAffX0sdJvrVuavVxsyfZgF/G8QKn1YTL
         m+Qv224sAjh2VN3ERIqYeMmq0Y+Kr0z+xqw7bF4rtwZEHHzyhTfdBmM8dbW3WzNk1buE
         ehqmomdzpigTlyNMmjqOjpgDnKT5FoTDaG8R8SGdqMxOF0NY1e023SXOJ3il3rd1sSPq
         dZp4l4ErNh4a2BCMXIMJCLMS+TwBSMYl8/efdSsEHSx19HT9uQDW/qYwY3nISUz86lP4
         LFToxsAJ0eTY+8CFP02h0wkNWLbAChD/9hzfegbZ8rk+vBe/AH57NAPXfU1tc2HSxWd9
         kz4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794314639; x=1794919439;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=izXQc1m6uJs2OWW2AxpmmxzIFdzwjCtP0swelOYB4Bk=;
        b=HulwZfBBMf0up8CSJS6Y3px3FRtAQq5GY874pBfKVvV7N6wn6eibnuxx6tItj/GSzS
         RsIvYcLei/8hlTBAsBen6TER4uJzesQe0KsNq/8d6e3bi9g1f5FK0zCK9g9JqjGxJSuF
         p+bCjWq2xzmncK5IHFbMMquprP6BLUz8eool90AzXy9ueJQCwp6pLVgdKL3ERkcs32uD
         D8+qw1xHsCk5FLfig+9OtsceSToPmak0bRvwBNkFQbtaV3rjRd7+0HnU7XedIzH53UPZ
         B5pMNBwEvHZY77xNVPZZfsrIJFtkpzjqlTrh+VlH0G75CyWcaurmLb1a276pfmbkVamL
         f87Q==
X-Forwarded-Encrypted: i=1; AL+hErGp0wYkrJ2/Fdhc3XbznqDJtHsI818emBmkwSdRfhxN6rtEcO2yL29anOXZ3TvTQXqY9WOAZ5qLxulMSFkzbw==@lists.infradead.org
X-Gm-Message-State: APuU4Z9BtWtyoZdO9xStX+ktqz5okplK4BnnVGqm9QDjPPsNBvwG38Ik
	9YUnVrWNy6P1FaxIt5DaxZl4fcrn/wFo/x7SsV+JtlNmNTwAlDCHoSuCDY7QK98xgF1ve9a07ng
	DRPBJ97ua4PFV3AE3xD1Q6Aet9R1LaPeRxTnCYXEhYOMcq+vrKUNgPgZR9xThT5oocU5sNulUno
	E=
X-Gm-Gg: AYBFou0fiDZW563fHR9PEarIW49wct3fY8/zR0HpikJwChOPFmjgdVxZAFlW/nnA2bF
	JYvmDmc5OlV/TKSbQ5GnzJtCrxlHaGiz2zbnJSF7wNLisScnrgDh/2NrE8ft0nTub9rOJEc4qE3
	wKUqx0S30pdSHPR6lEZO+MmPgAAKNPbCH9iuGsxdltsHOwgEB3MLD2YVdw/tty3G+8kyYH5Kc4U
	xIyNV3Pac3wKJF4ZMC09Y9PaOPPyS75xcnw09OfmO8mVNquY6swt9p81QZ9yoOD9FY7tvFfjGhA
	IHrNU1ftiuTXuOwvfMyAM7vgyMJs33lbDNoYhr4+/Q8++Y6nz6PsXjqjJc6KPnZ4PAOeQOY1d6o
	eK90WFm7tEKMBavdcHO8hZC/+x59xDNgzz+uTcWx1NmUXn4l/pm7Y5bttbOLsEgc8PnDwRIU=
X-Received: by 2002:a05:620a:a2d5:20b0:945:cfbe:816e with SMTP id af79cd13be357-9479f3d6b39mr352548985a.4.1794314639185;
        Tue, 10 Nov 2026 04:43:59 -0800 (PST)
X-Received: by 2002:a05:620a:a2d5:20b0:945:cfbe:816e with SMTP id af79cd13be357-9479f3d6b39mr352546185a.4.1794314638695;
        Tue, 10 Nov 2026 04:43:58 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a6551efsm103736966b.68.2026.11.10.04.43.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 04:43:57 -0800 (PST)
Message-ID: <830a0984-8938-40f6-9400-5962dfbbf274@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 13:43:54 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] thunderbolt: add platform NHI driver
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Mika Westerberg <westeri@kernel.org>
Cc: Andreas Noever <andreas.noever@gmail.com>, Sven Peter <sven@kernel.org>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20261110114925.722014-1-chunfeng.yun@mediatek.com>
 <20261110114925.722014-5-chunfeng.yun@mediatek.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261110114925.722014-5-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: TvHPR_CcDD5jcewF2-rdQop1lCRiVnbK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA1MCBTYWx0ZWRfX7PkvOrxsd8AX
 UzIhsgl9NQAP8iZ+R+VXlySNYj8RkaMzELVXIdMflyeN2LiERWz+il6OvUczjrFKCSAef6bQV2r
 eyYyFzv///zMpxejnScQkz8F9gDqdK4=
X-Authority-Analysis: v=2.4 cv=FuiQbGrq c=1 sm=1 tr=0 ts=6af3118f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=mpaa-ttXAAAA:8 a=1GaHgJMAeWfMa6zh5XUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: TvHPR_CcDD5jcewF2-rdQop1lCRiVnbK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA1MCBTYWx0ZWRfX4OUoejNjTF3V
 tAV5/K1N+HK853p3F7pIp00vuq6OTzeHXjYFJ9rGxM8RSWPZeDJcVNrVpXog2JYDSmsuF+QseVs
 OpS5WaBUkIOfbCfkXkMe4x2E78TI4VynT7aO9ObDkJnn/soiyy2G2Ub6awaCifrFlPlY3t5Xxzo
 Til6De06DpwHg0zXiiJBaR9A/iEW3mdk4HvbbjlFF4p2z7TBn2Sb6NSHZdk7xi3uztmdyerz0js
 v+oqGLPg4lsiJplRihUnPpl46jrkc7xkHYuGIWf/Ov0s6pD0/F61T+RsWK7Z0ZuwCkguJ+9TVnN
 H5hRbfNa/FcHVu3SK/oPv9tMlar8EZgc3OY4bWDiHIT+GhbzO8vxhSISPap8NGyhKyXk8bugU8/
 Bag+MH1qmma4sf9/Iqle+LA9M/+vOZQEzB/EW7ETeZ7rD9v76YQNXUtit1ZDA31yLa7sCJ0E28q
 N/uvO9CQTlg7rAeml9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_044401_104745_D468B81A 
X-CRM114-Status: GOOD (  19.00  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/10/26 12:48 PM, Chunfeng Yun wrote:
> Historically, the Thunderbolt/USB4 Native Host Interface (NHI)
> controller has been exposed as a PCI device handled by
> drivers/thunderbolt/pci.c. However, some SoCs (such as MediaTek
> mt8901/mt8992) integrate the NHI as a memory-mapped platform device
> described via Device Tree or ACPI.
> 
> To support platform-attached NHI controllers:
> 
> Introduce platform.c to register a platform driver matching
> "usb4-nhi-platform" (OF) and "ACPI0015" (ACPI);
> Implement platform tb_nhi_ops hooks for pm, interrupts related;
> 
> Support an optional dedicated wake interrupt: on integrated SoCs,
> the MAC/PHY reside in a power domain whose clocks and power can be
> gated during sleep, preventing the primary NHI interrupt from
> acting as a wakeup source; so add an optional dedicated wakeup
> interrupt which comes from the always-on power domain.
> 
> Clean up the unused nhi_enable_int_throttling() prototype.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2 changes:
> * Added CONFIG_USB4_PLATFORM to build the platform driver as a separate
>   module (thunderbolt_platform.ko), instead of statically embedding it
>   into thunderbolt.o.
> * Renamed plat.c to platform.c, renamed internal functions from nhi_plat_*
>   to nhi_platform_*, and updated the Device Tree compatible string from
>   "thunderbolt-platform" to "usb4-nhi-platform".

There are still no dt-bindings for this meaning it can't be merged.
You also haven't answered Sven and mine's concerns about this being
actually used.

Konrad

