Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8350F606A32A
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 11:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gR+uEGIQ;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P1LCYAuM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GYyIxbdb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=g1svp5E9pb1rvrFjE3ldylGmmn2srl47JCoHJgVCeZs=; b=gR+uEGIQl1qGv2
	bqquIazgeAb6jPEOOozgy+OTq0ZbtyCNFU/ZLLMTGZYgB4SN9zh/1RtBj7yac4UWzauJ+ALpgFFPz
	cuk5zEXrnNzeJpndsB8Q6sCPRe8DX/6SxL6+9IwR70og1JvrpTevH2aIaGV9r8CJFrE4I+bHRTHF1
	MSfMAfOgUrvOlzo9+sXQMYqdEes/PTqYyCEysU/VH8Z83jjf7IseLSafB3vQNcl50RR7+fFNtGroL
	DbpG/SradmcnBnvKpMdwfxzqzmyHy/2qvcEW4opJH2MFF028lLacFWCjHPx5VzIPdwx0gno5uETES
	LCIkqWj95Ye0IMe0k6/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXI3-0000000CocP-10oS;
	Thu, 26 Nov 2026 11:05:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXHy-0000000CobD-3flz
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Nov 2026 11:05:21 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQAXSC83049853
	for <linux-mediatek@lists.infradead.org>; Thu, 26 Nov 2026 11:05:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g1svp5E9pb1rvrFjE3ldylGmmn2srl47JCoHJgVCeZs=; b=P1LCYAuMr/D5qPTC
	qvoMVcOhInukkngJQPbRRoVLIxCrm3Cbfltg0ixbMdjOrOCz28lnsbK/FQbX9Kxo
	BkB6bDX3zRnt8Lih15T2VcTNv3NsYAZmdBNcGIxrJ9waXYUlSRR2c5ItayhUE+Lj
	UIJqi1GcDJuTJV8n5mrLlU/qf/cOXHqVrbFPCDN4b0Cqz9iwZUQbDA+S+IHfUpR7
	ZaGPJrzmcNTomoKTKw6DtX4u+/Ex32UNVMKqo5Hvrp3sL161tdjQ+yWKRBUIzIeB
	VPjhRhXeaJs2curePdUvH8qZN14pakXXbheUUye90cMh2duVMtLEbyyacpM8Tti8
	AevJyw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662satyg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Thu, 26 Nov 2026 11:05:17 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b49dd1e77cso3637523a91.0
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Nov 2026 03:05:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795691117; cv=none;
        d=google.com; s=arc-20260327;
        b=Rqu/Vy6LrCDbdb9MHA22IYRtObsHOm9adh/kQV78AWZ8AnblsWciJYTnPgin9kJnUk
         xdpx2F5YK2kBjfikaOPHSSxCl92+TD1j3zHjjE4vAxVLqma2OtMVMcjv4wUR6NF/r1d9
         zDOATpyHadapVeNaEOE4NqNtyAGaj8dRwzgrXlwNC3JghK2jaVLNQdfoP/iiFNyBsoS8
         YljuDqu5iwFNTGcyUaojzCuiQU+BqtaaWyOWmfNkRDgKZgAUztttWO0A+wTqjlGNScBj
         cElHCE+0vHFEnC4hQZ8/Q+8ydkpzowOArwh9Ch0WPhfyAp+7QU4V/PtwalshIXaixsxe
         q7xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g1svp5E9pb1rvrFjE3ldylGmmn2srl47JCoHJgVCeZs=;
        fh=DXbNm00Kpx+v+buLHO4pvWEDAaV3aCEYpgG5ilUmOj4=;
        b=AxO5K58E3xF7TrLR0EShYWVsadLW2bXsGXx22y8WrV+INrLnT2SWkHe31S//mOML9q
         uplgk0XFlCuMI9pkRzQNXRbdXQ2W5AgUt3xfhqdBamX17Qc6xqWZiVpLpKHCYDZn1dl+
         MO09lHxk96Nlu/QYvAo4OWo6lIDTgdlBd2JXIFlXNooeK1j9faSuDDpRKysT5L+t+xnj
         iS47Bu4JNQTtsdu6ujSClEowz26STHH21iEC8EAV33t5HDSx0AK+tije6xSOLDTScqyR
         Skce9CZvgSKkAAogHtuDZ3nuChLWUPzVbP72xXc+wR5/czj2VE890iNOiDL2SU6TONX+
         aw5g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795691117; x=1796295917; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g1svp5E9pb1rvrFjE3ldylGmmn2srl47JCoHJgVCeZs=;
        b=GYyIxbdbnSM9lzhr7fJbd7X8dG3qG4UVOZ6WunRbw6iEsYcUuG+I5yNL4d+ZSEhNSa
         wfYARgZhCtx6UTRilcQzsJhGg2AqRjtBZjLYHpkji7RGAxEOGChgB9e+XUyhxZXk/7pw
         0B/7YIKpXe422L3xs7lCDVuwSHrCjQLMdx5/0MLEBOy/+dQPMBa7418I1Wqp/P9RKN7V
         7SkGLBeyUjw8tEGd4snwEYXp5Ml7sKq3UnhtE3WxBqtAfFnIT0muwmQq2r9egPYMVTQL
         3uGOoLmmzI4Wvz6iD/twccrYjwX1TpnhHkk6CBTTT++Nil/8Rge4X6qj4jymuIdCuuV6
         7QOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795691117; x=1796295917;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g1svp5E9pb1rvrFjE3ldylGmmn2srl47JCoHJgVCeZs=;
        b=vRO/pglRQS4R9Oys3fuXrB/uSobsTrGAR8qX1TU69oMwj+NCEjwmPIFrqS1iTRLH3S
         U2gXDhdruFxUT4DSqhBpvGcCrCHYsfJkqo9vU61nBH9tmsXeHKh89d4u33cAUMCpn7/A
         ToRn6+57apfdyJb49UzNaFQULhBaQbs4bEb/C2jFJ8gCgWy429rXhT6x8pMsgoM3r+eq
         mhtnEXjSGXqe6U+Qlsp0RZb9QdWcyukFcUONqzNsep/KK13ht6LgFi54nrzox92mAKtN
         CSnzv8VxccHHGTJqbLLbxvy9QdT3YT0UJgqYY2hMaYJFLXGuh9MjSJSV3qEdlRYbybwD
         VL1g==
X-Forwarded-Encrypted: i=1; AL+hErGsikuehPgKCIi8XP9LvVVlXFSB+2qpwgouKoQHJUi/yMV4toXMOK97cR60SEolIXtjHEveM2KqTen6ZfUoQw==@lists.infradead.org
X-Gm-Message-State: APuU4Z9YHMB9gEOUwzTfpYi+oV7Qh7Njn+KU/oTfpx6I0N/hJFBilM+D
	PQFzypEroUtCqV+SIpWnoENC1c8olsLhgJALU2pyavzw2CmzQWHyJT7bMCnjneK60NG+dRgLj/R
	iGoFb9d2lzypznVVvokxw5y96ryxYGBKb/nwBrQu1JvS24rzw9aRs5H90coihirEnzjCa5wKTzv
	RsDrJDvr3vOWHMiF0qLRhdMGjOj0VuQeWImLX1geOQ2v5VUMLlBw==
X-Gm-Gg: AZFdTZfdR5dIrboFrFnkt9mJzkiBUaqrCP6ZkaOcMAU9+h+77agEqVGn1YXHcJpbrc/
	M0jnta3ua/6QugfIJDX76LAZeCMpsX53iEh5hxptGGR73U7fBDX8a2uhEazfJANJKvOnky6fErV
	8Qj7KCrFdW8K6UMJVRvxwoT5wblBPNpt6MJQNlpPRIDTn+RhYxd9igbhkk1A==
X-Received: by 2002:a17:90a:d2cf:b0:3b3:b595:2473 with SMTP id 98e67ed59e1d1-3b41c906b61mr18544097a91.24.1795691116587;
        Thu, 26 Nov 2026 03:05:16 -0800 (PST)
X-Received: by 2002:a17:90a:d2cf:b0:3b3:b595:2473 with SMTP id
 98e67ed59e1d1-3b41c906b61mr18544043a91.24.1795691115988; Thu, 26 Nov 2026
 03:05:15 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261117173738.1073856-1-Frank.Li@oss.nxp.com>
 <20261117173738.1073856-2-Frank.Li@oss.nxp.com> <CAPx+jO9RwkpSKwq6vq00uoXK-mcovJ2LMH7b_ByRnxOUj8nH8w@mail.gmail.com>
 <CAJZ5v0jsnLjEBxa1R4Q3hZLZKrCUW0xSE9SqLB8bd4tNAhXTAQ@mail.gmail.com>
In-Reply-To: <CAJZ5v0jsnLjEBxa1R4Q3hZLZKrCUW0xSE9SqLB8bd4tNAhXTAQ@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 12:05:02 +0100
X-Gm-Features: Aa3M54r_rMhLGHc1vqQ3FXriLYRwoLb-Xyx7xbWcsA8f-DpP_bkxDUBWaFpBhbQ
Message-ID: <CAPx+jO9JYTygL7F4nc9zb=iOmeKfdpa6-_QBOvAmMN9fp6HfwA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] PM: runtime: fix stub pm_runtime_get_if_in_use()
 for !CONFIG_PM
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: Frank.Li@oss.nxp.com, Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Heiko Stuebner <heiko@sntech.de>, Ulf Hansson <ulfh@kernel.org>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Matthew Auld <matthew.auld@intel.com>,
        Hans de Goede <hansg@kernel.org>,
        Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Mark Brown <broonie@kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
        Yong Wu <yong.wu@mediatek.com>, Will Deacon <will@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, Marek Vasut <marex@denx.de>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        "open list:POWER MANAGEMENT CORE" <linux-pm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support:Keyword:mediatek" <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support:Keyword:mediatek" <linux-mediatek@lists.infradead.org>,
        "open list:ARM/Rockchip SoC support:Keyword:b[Rr]ock[Cc]hipb" <linux-rockchip@lists.infradead.org>,
        imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
        Simona Vetter <simona@ffwll.ch>, David Airlie <airlied@gmail.com>,
        Matthew Brost <matthew.brost@intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Alessio Belle <alessio.belle@imgtec.com>,
        Luigi Santivetti <luigi.santivetti@imgtec.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
        dri-devel@lists.freedesktop.org, imagination@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linux-sound@vger.kernel.org, sound-open-firmware@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6b08126d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8AirrxEcAAAA:8
 a=QyXUC8HyAAAA:8 a=GFqr32JmAAAA:8 a=pGLkceISAAAA:8 a=r_1tXGB3AAAA:8
 a=iox4zFpeAAAA:8 a=7CQSdrXTAAAA:8 a=mpaa-ttXAAAA:8 a=QX4gbG5DAAAA:8
 a=ZLGELXoPAAAA:8 a=P1BnusSwAAAA:8 a=zd2uoN0lAAAA:8 a=e5mUnYsNAAAA:8
 a=JfrnYn6hAAAA:8 a=foHCeV_ZAAAA:8 a=x6yKa4QoHz4R4KwlW4MA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=ST-jHhOKWsTCqRlWije3:22 a=f02Ha7HRcztGgdyUxOxW:22
 a=t8nPyN_e6usw4ciXM-Pk:22 a=WzC6qhA0u3u7Ye7llzcV:22 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=AbAUZ8qAyYyZVLSsDulk:22 a=CFiPc5v16LZhaT-MVE1c:22 a=D0XLA9XvdZm18NrgonBM:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=1CNFftbPRP8L7MoqJWF3:22 a=h8a9FgHX5U4dIE3jaWyr:22
X-Proofpoint-GUID: NBRFNTM45kgHuHv5Gi6LQ5R1_Otcciq4
X-Proofpoint-ORIG-GUID: NBRFNTM45kgHuHv5Gi6LQ5R1_Otcciq4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0MiBTYWx0ZWRfX/oL+iIPVXAI4
 YUHyYEMyhuid2UbBNV+DvuCH+LOCMEmpcQpCRzdvNcpqayhjmjUPd2xx5UQRAbF6GI1UwSobgiC
 wyLVzEBCywfP8APLmYNL8/0pDNDET2wPQMPLr/eCwwx/aTTd1oYAiRXThRE5xifrEI4CA7Lw/Rv
 xwTR+0jKInWJdsPl+pz3sc8K/cXgEGUwBSU+PtdIyqD6yyc6bRV6gWZyKDZ+bOlNHgIe6tPWE1Q
 q17SPlseyCFzpCKm2AqAdyp/r3dQMZOV+uXFrYXuBjta0bDT+yWsReHz8dqCR1x//a2DT732Sif
 uECQtxjBhcFaUlNIqC3psOGyzRZraK6X6CSbYEa8fw9ufa4uOsmTeFzNrbmyjfaUheCB7RliZ/e
 mZ3Nz3HT+Fx/r3rp2qXN6g7IjOSa352PMLtIdcZZzuHEK2kGiMEEO0zbM1kQS2WX8ECDri+yybB
 Bep0z9DBFg1tgQP5zsQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0MiBTYWx0ZWRfX6LoHYlPrMpVe
 MPivQHFAq0kYzbaMhMgB+CSneUDneufsdmKx2vqLwIpWYkZ49JySi0/6li+41XNb9sJVzXYJUcT
 A2gWcayJ6cdKWOyzMAzYfHw3LVcf0Qg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_030518_946844_92A002CF 
X-CRM114-Status: GOOD (  30.23  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 25, 2026 at 4:53=E2=80=AFPM Rafael J. Wysocki (Intel)
<rafael@kernel.org> wrote:
>
> On Wed, Nov 25, 2026 at 4:07=E2=80=AFPM Ulf Hansson
> <ulf.hansson@oss.qualcomm.com> wrote:
> >
> > On Tue, Nov 17, 2026 at 6:38=E2=80=AFPM <Frank.Li@oss.nxp.com> wrote:
> > >
> > > From: Frank Li <Frank.Li@nxp.com>
> > >
> > > The stub for pm_runtime_get_if_in_use() under !CONFIG_PM currently
> > > returns -EINVAL.  The real implementation returns:
> > >   1  - device is active and its usage counter is non-zero (bumped)
> > >   0  - device is not in use or not active (counter not bumped)
> > >  -EINVAL - runtime PM disabled for this device
> > >
> > > When CONFIG_PM is not set every device is permanently "active" and
> > > always considered "in use", so the stub must return 1, mirroring
> > > __pm_runtime_resume() which already returns 1 in the same build.
> > >
> > > Returning -EINVAL breaks callers that test the return value with
> > > comparisons other than "!=3D 0 / =3D=3D 0":
> > >
> > > drivers/gpu/drm/i915/intel_runtime_pm.c:
> > >   if (intel_runtime_pm_get_if_in_use(rpm))
> > >   which wraps to: ret =3D pm_runtime_get_if_in_use(); return ret > 0;
> > >   With -EINVAL the wrapper returns false, causing an incorrect error
> > >   path in the GT fence revocation code.
> > >
> > > drivers/gpu/drm/xe/xe_pm.c:
> > >   if (pm_runtime_get_if_in_use(xe->drm.dev) > 0)
> > >   With -EINVAL the condition is false; xe_pm_runtime_get_if_in_use()
> > >   returns false, so callers believe the device is not usable.
> > >
> > > drivers/gpu/drm/gma500/power.c:
> > >   return pm_runtime_get_if_in_use(dev) =3D=3D 1;
> > >   -EINVAL !=3D 1, so the helper always returns false when !CONFIG_PM.
> > >
> > > drivers/gpu/drm/imagination/pvr_power.c:
> > >   if (pm_runtime_get_if_in_use(...) <=3D 0)
> > >   -EINVAL <=3D 0 is true, so the driver always takes the "requeue" er=
ror
> > >   path instead of proceeding with the active device.
> > >
> > > sound/soc/sof/debug.c:
> > >   if (pm_runtime_get_if_in_use(sdev->dev) =3D=3D 1)
> > >   -EINVAL !=3D 1, so d3_prevented is never set, corrupting exception
> > >   debug accounting.
> > >
> > > drivers/iommu/mtk_iommu.c:
> > >   if (pm_runtime_get_if_in_use(dom->plat_dev->dev) <=3D 0)
> > >   -EINVAL <=3D 0 skips the TLB flush, leaving stale IOMMU mappings.
> > >
> > > drivers/iommu/rockchip-iommu.c:
> > >   Three call sites use WARN_ON_ONCE(err < 0) or similar patterns.
> > >   -EINVAL < 0 triggers a spurious WARNING on every call.
> > >
> > > drivers/media/i2c/isl7998x.c:
> > >   if (pm_runtime_get_if_in_use(dev) <=3D 0)  (two call sites)
> > >   -EINVAL <=3D 0 causes the driver to always skip register programmin=
g
> > >   when !CONFIG_PM.
> > >
> > > drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c:
> > >   if (pm_runtime_get_if_in_use(dev) <=3D 0)  (two call sites)
> > >   -EINVAL <=3D 0 prevents any debug statistics from being collected.
> > >
> > > Fixes: a436b6a19f57 ("PM / runtime: Add new helper for conditional us=
age count incrementation")
> > > Fixes: 3b85b7bcccf4 ("drm/xe: Fix display runtime_pm handling")
> > > Fixes: 672c473576ca ("drm/gma500: Rewrite power management code")
> > > Fixes: b30289e7fa92 ("ASoC: SOF: Fix runtime pm usage counter balance=
 after fw exception")
> > > Fixes: c0b57581b73b ("iommu/mediatek: Add power-domain operation")
> > > Fixes: 51ef2be546e2 ("media: i2c: isl7998x: Add driver for Intersil I=
SL7998x")
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > > Change in v3
> > > - drop tag: cbb819c363c5 ("media: rkisp1: debug: Collect input status=
 by sampling ISP_FLAGS_SHD")
> > > selected PM at arch config
> > > - drop tag: 0f181d3cf7d9 ("iommu/rockchip: Add runtime PM support")
> > > selected PM at arch config
> > > - drop tag: 9d58aa46291d ("drm/i915: Fix the GT fence revocation runt=
ime PM logic")
> > > guard by CONFIG_PM
> > > - drop tag 727538a4bbff ("drm/imagination: Implement power management=
")
> > > depend on PM
> > > `
> > > Change in v2
> > > - new patches.
> > >
> > > Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> > > Cc: linux-pm@vger.kernel.org
> > > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > Cc: Maxime Ripard <mripard@kernel.org>
> > > Cc: "Thomas Hellstrom" <thomas.hellstrom@linux.intel.com>
> > > Cc: Simona Vetter <simona@ffwll.ch>
> > > Cc: David Airlie <airlied@gmail.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> > > Cc: Alessio Belle <alessio.belle@imgtec.com>
> > > Cc: Luigi Santivetti <luigi.santivetti@imgtec.com>
> > > Cc: Liam Girdwood <lgirdwood@gmail.com>
> > > Cc: Mark Brown <broonie@kernel.org>
> > > Cc: Jaroslav Kysela <perex@perex.cz>
> > > Cc: Takashi Iwai <tiwai@suse.com>
> > > Cc: Bard Liao <yung-chuan.liao@linux.intel.com>
> > > Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
> > > Cc: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> > > Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> > > Cc: Robin Murphy <robin.murphy@arm.com>
> > > Cc: Yong Wu <yong.wu@mediatek.com>
> > > Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.c=
om>
> > > Cc: Matthias Brugger <matthias.bgg@gmail.com>
> > > Cc: Heiko Stuebner <heiko@sntech.de>
> > > Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> > > Cc: Dafna Hirschfeld <dafna@fastmail.com>
> > > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Cc: Michael Tretter <m.tretter@pengutronix.de>
> > > Cc: Daniel Baluta <daniel.baluta@nxp.com>
> > > Cc: Will Deacon <will@kernel.org>
> > > Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> > > Cc: dri-devel@lists.freedesktop.org
> > > Cc: imagination@lists.freedesktop.org
> > > Cc: intel-gfx@lists.freedesktop.org
> > > Cc: intel-xe@lists.freedesktop.org
> > > Cc: iommu@lists.linux.dev
> > > Cc: linux-arm-kernel@lists.infradead.org
> > > Cc: linux-mediatek@lists.infradead.org
> > > Cc: linux-media@vger.kernel.org
> > > Cc: linux-rockchip@lists.infradead.org
> > > Cc: linux-sound@vger.kernel.org
> > > Cc: sound-open-firmware@alsa-project.org
> > > Cc: imx@lists.linux.dev
> > > ---
> > >  include/linux/pm_runtime.h | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/include/linux/pm_runtime.h b/include/linux/pm_runtime.h
> > > index de9e7518ecef2..1d983fe55a16a 100644
> > > --- a/include/linux/pm_runtime.h
> > > +++ b/include/linux/pm_runtime.h
> > > @@ -276,7 +276,7 @@ static inline int pm_schedule_suspend(struct devi=
ce *dev, unsigned int delay)
> > >  }
> > >  static inline int pm_runtime_get_if_in_use(struct device *dev)
> > >  {
> > > -       return -EINVAL;
> > > +       return 1;
> >
> > This should be return 0, as we did not bump the usage count.
>
> This is kind of moot because there is no usage counter.
>
> However, the caller may always take the opportunistic "in use" path
> because there are no potential costs related to it.

Of course, for the !CONFIG_PM case that makes sense.

Please add:

Reviewed-by: Ulf Hansson <ulfh@kernel.org>

Kind regards
Uffe

