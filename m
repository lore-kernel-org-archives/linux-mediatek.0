Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C038606A31E
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2026 15:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R7F5y2te;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g1iGMU5+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AnIwv7sF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=db+Ha9wyQwvqpCYlhHffmTpkau51LqeWzqMbVXiyKQ4=; b=R7F5y2tevHHdHL
	wmPkbbqDkanxAj6/XX7r2bvUj26FhZf9UDQcx+ontBPcmsBBUP2M1kVhV+wKsicGC9dcm0fourM42
	BTXDDW1IRWrrhR9lq+qvOZn4akSt8An5F8s+1QnZjwUl/IZW80QYsb0Hj3xtY49TYyaa5niLLRxzH
	D/C0FgoM8qn5f75qMPj9J45/IYknTp3EcuaX9ResIdO31NgtZoaImxgT9CdK40avRQTvZKu5AADdZ
	MM7t1scItkSxLGYgUQk1BbJTUckfo5bwK4IWaNVkgqE4EmqmMPu6VpkrtDZ3rCG7LYy0VLA1HxV+J
	wFv04fmeCFrW3XJJ2U3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEb8-0000000AIQC-06yp;
	Wed, 25 Nov 2026 15:07:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEar-0000000AINY-4C7u
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Nov 2026 15:07:45 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APEMIbE175458
	for <linux-mediatek@lists.infradead.org>; Wed, 25 Nov 2026 15:07:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	db+Ha9wyQwvqpCYlhHffmTpkau51LqeWzqMbVXiyKQ4=; b=g1iGMU5+iI+taWPx
	yLKnXluxP0uaMQZ6O5vPH2iEJkzvOVHnbjFOxlUKSgN9I0PnTwKk9RPx0tz5phAE
	cWXakaxrTlDBuo7Ig0ayxg17cVaHRUvakyzifrARLhcIgTZpCsEH6XS8Zm9/J4wZ
	RXv0fAKx89tE2ZoK/4K+jz6tuSEyQjzpKoEat/afA6amSKDrjYvpqTeB9cRZsJbX
	pRXFEREHLj3Q0aKAwidv2GoSEMoP/vmxEhm0axosUN/os6TTs9KZmu04624uM7Nr
	ASb1nzQhhyAYBm/r0M49GHRkHxqW+wg42e+m20IdMGvKqw2YgnMNycX1SM6phLCC
	sLz5Lg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vv2sd9y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 25 Nov 2026 15:07:32 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b4b76a2b95so3353073a91.1
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Nov 2026 07:07:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795619252; cv=none;
        d=google.com; s=arc-20260327;
        b=Ur3pafYcGK/q8uzOlol50eSFxZxcGivPNcrpfFYIYWEKMLylA9MuYBWF0VXvLh/2Co
         u40F4n++3M2xoIoK+bdbUSjZQXUkmMvlavhlj9kiTERBhVnPceBtFH5+K3tsCdESx/f0
         +tnqmoPBJjM1LmQH93+ZHBOwXPLdzts8xUDfE+tPoeoHOu+dMpgP8BrqM5Whvv18vUUt
         U3Po+DuQJ1L57wlrKyC3D3zDkLbIKkYfkFOomN5gif0WWJFycphzp7g5qEVpsegH9fSJ
         kfaO1jXQOgihgse/B3gQIdB7NFqkf64PkQTadiaYCgyS77s5+uMDibTe276sO6TZo2AK
         27jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=db+Ha9wyQwvqpCYlhHffmTpkau51LqeWzqMbVXiyKQ4=;
        fh=CJFLWaV9GKsrJYYEvU2VJ8uwBdKZ24ZS1DFuxHy6lwA=;
        b=tARjM6Ky7BlTIXHLtc94TuipBqaZUBTBgvRPsL7GxXjETv/dt/fOd0ATt7/t4HNQet
         m8JtPiVM27pAdqGFe/ZiZ8H5JFsV753+h9QSaoLGz9vKyEAavIMvk6etl5roniZGsot3
         cOCqDoyIVJ9JgIA8ZYILZodeR5pcdfcFz0/ExDqMWxq95Rjr801ZM2lDT2TJEL+49LqE
         7/SGgR3aXfByNDStafPB0OJl0zMvDIV02MSbhQJK5O5cVEJtiqIGdQQ+jepciG7+cIux
         FNW7lZm9Vq1ltAHeShGWl9LzFQTjaHC3+lk0O36wDRiHNLbXxpkLMUtbMRq5umATzb3h
         b3rA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795619252; x=1796224052; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=db+Ha9wyQwvqpCYlhHffmTpkau51LqeWzqMbVXiyKQ4=;
        b=AnIwv7sFHlh3fFlaxb9c8NnyY++qsYk/e4kwQa3Xegw0x1hJQskXaH14UOgpgHvlhI
         PHfwFn85eciIhvw/PkRrIkfRid3/KfpTdNOeLcJpqDU6VN+66egWGvGtq/r9d0P7h9Ih
         U6NH70Q3tsvGc/7wSN6vsYe1vRVjUhivc/XaL6MPVRJrlTiCdd7xADmfhZWQz71oPucG
         YgC8wvEwrS7ExWA9wCkaxRPEXOejLZmSJvDEGfSn1D3Sl/I6iqsHsD+z4GB91uwjAuQN
         zCHX2y94g2v7hmgpmP5BdpnKwa1Q2VqFUxZ7kr4GU02hmjMAcME8KHcMAbaJeDx892Pt
         Fv8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795619252; x=1796224052;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=db+Ha9wyQwvqpCYlhHffmTpkau51LqeWzqMbVXiyKQ4=;
        b=Tko+uRKNfJ15EZ5iEsSep9dJDA0hv4bYIfTc6eQGHMOKHAIIzmfFM29pBpMNKgC9Rj
         QByAP8YrgWoT2HHoiM8g6M5oFW1Xr3rHkzsJQaDJww8LhVB0c99pNRfJkPryMrDSc+m3
         lMKtQwkxBhlhUKKT3O2lqCb1UeYPqA2uZxsEIrE9abjzYF0r8J9aua1neM0Pv7ywa0+E
         Wse3P/w40Bu9HYMbzbUQBI4jZfXv54dl8FGlzyWfjeDpcxEAh/XcJh8UNndYXxzWVv8u
         /htt2UdVzOJMtGTQ665TlbYKA4IbGxcUxI0RHw8Z++jCWD2xKMqbQzUs4RftFBBTY+/q
         pVDQ==
X-Forwarded-Encrypted: i=1; AL+hErEDnTP+Lb7sEuUOqheXdv5Z2rAn+whHd0aJ/zTittWjmrKR5fpIxUBurhdWQrg0pMgIF9Yvz+hUMi2yzHGNQA==@lists.infradead.org
X-Gm-Message-State: APuU4Z+qoZPa1c2tqYIsHFZ1W2cAacx2OybMmmsQAS6h0HOeoPU7flW/
	PagjexJv4XsOIer9VM9hGSlBo2f7BoC65F2IN83yqMW0C2vHiXowbyv52cI61kvLOwAVDmmjmaD
	L8F/itFVF2NLxCYp/GB/AJ8G0X4mcdWo3BXyfAZXwfc48zimOntQ5DzquDgK+3IQ3AIa2c0ag6o
	Uu8km8UzBylHIZJlNzdHrwSYrkeiEuQaDDTkOqwbLTt01ifW58aA==
X-Gm-Gg: AZFdTZfMd0rqG16i4ShV3RZW547n1FG7O2cfzbGOy8cPBdEqSXwdz2EOFO06rG1AyWe
	DKOoVliKyQTmvRP0eodAa3RP5WdJcdPt7i3Xy6QLLMhdDxxwz7RV4FI4FULMK5V5xOD0U5zORqL
	iylhELuv1dQp5cBjBUTZyNdixGaa3tyRboNt+SW6bTIuPWyUvOC1He580sHQ==
X-Received: by 2002:a17:90b:4983:b0:3b0:97b8:d6b7 with SMTP id 98e67ed59e1d1-3b41c931d29mr17812812a91.42.1795619251737;
        Wed, 25 Nov 2026 07:07:31 -0800 (PST)
X-Received: by 2002:a17:90b:4983:b0:3b0:97b8:d6b7 with SMTP id
 98e67ed59e1d1-3b41c931d29mr17812748a91.42.1795619251127; Wed, 25 Nov 2026
 07:07:31 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261117173738.1073856-1-Frank.Li@oss.nxp.com> <20261117173738.1073856-2-Frank.Li@oss.nxp.com>
In-Reply-To: <20261117173738.1073856-2-Frank.Li@oss.nxp.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 16:07:19 +0100
X-Gm-Features: Aa3M54qdNdgAc_JRldH76LdEJD_mei5kpsUzvFW9k6ee3hswc_FKGO5qrF_F3iw
Message-ID: <CAPx+jO9RwkpSKwq6vq00uoXK-mcovJ2LMH7b_ByRnxOUj8nH8w@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] PM: runtime: fix stub pm_runtime_get_if_in_use()
 for !CONFIG_PM
To: Frank.Li@oss.nxp.com
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA2MCBTYWx0ZWRfX3JZIg70S5AAZ
 emJwAqf/DoX7yNUpfBfSGn613R1ASUJvuVyUS6epxsR4BHdETVan0xDsNIXUYZWl/5LAkyIpQoU
 mQ6WN2TJUcHdGrHfT5rAvAanbmIq1JU=
X-Proofpoint-GUID: XJ_nycAbntZIdq3q-sNlj6fcj7TJf6Mx
X-Proofpoint-ORIG-GUID: XJ_nycAbntZIdq3q-sNlj6fcj7TJf6Mx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA2MCBTYWx0ZWRfX5f2xtUZciTe4
 YV2OBHb8Xaq2zVZ+AJr4lxzvKKjZrzIg+Pn+rKJi+psc45cVqwmjqEcYBmsUzSZ208ubHPERSh8
 bCokKQuseHiheg8qUv8eWlh+377nf4fW49dBId3dQaiEnB4HPIPTSckp+vEwIalYkguWNfgzVPw
 uRHIT5LxSNy+8yF5BG9AI3E6CWCr3T2ba55x/PPmupEcYf7yBchzNEDAHNoZRrPYH+pCkViVg0s
 Q4+dwvMoBA609QkTpn9V5ujacxwFvtWTWJ74qE5CATD7EOdqwI+lj9P/6LxlFSrflLTccMlnnIj
 sPPoZpen5iardmQ6RkCOrxM8+4kC75/N0z+9vukTanQs5oMPMBWSnXSpQWwEJntCbSD8BPYOrlH
 wXALsfDw7+hfRG5Yos71BXTZ7G92kCuV697jpVi5IQMXyKYZvmGix2LDXng9PZXPiwXIbnqRnVs
 36/SmR7XtuAKBorhlkA==
X-Authority-Analysis: v=2.4 cv=A/z5rKWG c=1 sm=1 tr=0 ts=6b06f9b4 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=8AirrxEcAAAA:8 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8
 a=GFqr32JmAAAA:8 a=pGLkceISAAAA:8 a=r_1tXGB3AAAA:8 a=iox4zFpeAAAA:8
 a=7CQSdrXTAAAA:8 a=mpaa-ttXAAAA:8 a=QX4gbG5DAAAA:8 a=ZLGELXoPAAAA:8
 a=P1BnusSwAAAA:8 a=zd2uoN0lAAAA:8 a=e5mUnYsNAAAA:8 a=JfrnYn6hAAAA:8
 a=foHCeV_ZAAAA:8 a=Idd5WaZmN1QeKTrTtQEA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=ST-jHhOKWsTCqRlWije3:22 a=f02Ha7HRcztGgdyUxOxW:22
 a=t8nPyN_e6usw4ciXM-Pk:22 a=WzC6qhA0u3u7Ye7llzcV:22 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=AbAUZ8qAyYyZVLSsDulk:22 a=CFiPc5v16LZhaT-MVE1c:22 a=D0XLA9XvdZm18NrgonBM:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=1CNFftbPRP8L7MoqJWF3:22 a=h8a9FgHX5U4dIE3jaWyr:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_070740_267137_41EF4522 
X-CRM114-Status: GOOD (  26.03  )
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

On Tue, Nov 17, 2026 at 6:38=E2=80=AFPM <Frank.Li@oss.nxp.com> wrote:
>
> From: Frank Li <Frank.Li@nxp.com>
>
> The stub for pm_runtime_get_if_in_use() under !CONFIG_PM currently
> returns -EINVAL.  The real implementation returns:
>   1  - device is active and its usage counter is non-zero (bumped)
>   0  - device is not in use or not active (counter not bumped)
>  -EINVAL - runtime PM disabled for this device
>
> When CONFIG_PM is not set every device is permanently "active" and
> always considered "in use", so the stub must return 1, mirroring
> __pm_runtime_resume() which already returns 1 in the same build.
>
> Returning -EINVAL breaks callers that test the return value with
> comparisons other than "!=3D 0 / =3D=3D 0":
>
> drivers/gpu/drm/i915/intel_runtime_pm.c:
>   if (intel_runtime_pm_get_if_in_use(rpm))
>   which wraps to: ret =3D pm_runtime_get_if_in_use(); return ret > 0;
>   With -EINVAL the wrapper returns false, causing an incorrect error
>   path in the GT fence revocation code.
>
> drivers/gpu/drm/xe/xe_pm.c:
>   if (pm_runtime_get_if_in_use(xe->drm.dev) > 0)
>   With -EINVAL the condition is false; xe_pm_runtime_get_if_in_use()
>   returns false, so callers believe the device is not usable.
>
> drivers/gpu/drm/gma500/power.c:
>   return pm_runtime_get_if_in_use(dev) =3D=3D 1;
>   -EINVAL !=3D 1, so the helper always returns false when !CONFIG_PM.
>
> drivers/gpu/drm/imagination/pvr_power.c:
>   if (pm_runtime_get_if_in_use(...) <=3D 0)
>   -EINVAL <=3D 0 is true, so the driver always takes the "requeue" error
>   path instead of proceeding with the active device.
>
> sound/soc/sof/debug.c:
>   if (pm_runtime_get_if_in_use(sdev->dev) =3D=3D 1)
>   -EINVAL !=3D 1, so d3_prevented is never set, corrupting exception
>   debug accounting.
>
> drivers/iommu/mtk_iommu.c:
>   if (pm_runtime_get_if_in_use(dom->plat_dev->dev) <=3D 0)
>   -EINVAL <=3D 0 skips the TLB flush, leaving stale IOMMU mappings.
>
> drivers/iommu/rockchip-iommu.c:
>   Three call sites use WARN_ON_ONCE(err < 0) or similar patterns.
>   -EINVAL < 0 triggers a spurious WARNING on every call.
>
> drivers/media/i2c/isl7998x.c:
>   if (pm_runtime_get_if_in_use(dev) <=3D 0)  (two call sites)
>   -EINVAL <=3D 0 causes the driver to always skip register programming
>   when !CONFIG_PM.
>
> drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c:
>   if (pm_runtime_get_if_in_use(dev) <=3D 0)  (two call sites)
>   -EINVAL <=3D 0 prevents any debug statistics from being collected.
>
> Fixes: a436b6a19f57 ("PM / runtime: Add new helper for conditional usage =
count incrementation")
> Fixes: 3b85b7bcccf4 ("drm/xe: Fix display runtime_pm handling")
> Fixes: 672c473576ca ("drm/gma500: Rewrite power management code")
> Fixes: b30289e7fa92 ("ASoC: SOF: Fix runtime pm usage counter balance aft=
er fw exception")
> Fixes: c0b57581b73b ("iommu/mediatek: Add power-domain operation")
> Fixes: 51ef2be546e2 ("media: i2c: isl7998x: Add driver for Intersil ISL79=
98x")
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change in v3
> - drop tag: cbb819c363c5 ("media: rkisp1: debug: Collect input status by =
sampling ISP_FLAGS_SHD")
> selected PM at arch config
> - drop tag: 0f181d3cf7d9 ("iommu/rockchip: Add runtime PM support")
> selected PM at arch config
> - drop tag: 9d58aa46291d ("drm/i915: Fix the GT fence revocation runtime =
PM logic")
> guard by CONFIG_PM
> - drop tag 727538a4bbff ("drm/imagination: Implement power management")
> depend on PM
> `
> Change in v2
> - new patches.
>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: linux-pm@vger.kernel.org
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: "Thomas Hellstrom" <thomas.hellstrom@linux.intel.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> Cc: Alessio Belle <alessio.belle@imgtec.com>
> Cc: Luigi Santivetti <luigi.santivetti@imgtec.com>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: Bard Liao <yung-chuan.liao@linux.intel.com>
> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
> Cc: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Yong Wu <yong.wu@mediatek.com>
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Dafna Hirschfeld <dafna@fastmail.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Michael Tretter <m.tretter@pengutronix.de>
> Cc: Daniel Baluta <daniel.baluta@nxp.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: imagination@lists.freedesktop.org
> Cc: intel-gfx@lists.freedesktop.org
> Cc: intel-xe@lists.freedesktop.org
> Cc: iommu@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mediatek@lists.infradead.org
> Cc: linux-media@vger.kernel.org
> Cc: linux-rockchip@lists.infradead.org
> Cc: linux-sound@vger.kernel.org
> Cc: sound-open-firmware@alsa-project.org
> Cc: imx@lists.linux.dev
> ---
>  include/linux/pm_runtime.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/linux/pm_runtime.h b/include/linux/pm_runtime.h
> index de9e7518ecef2..1d983fe55a16a 100644
> --- a/include/linux/pm_runtime.h
> +++ b/include/linux/pm_runtime.h
> @@ -276,7 +276,7 @@ static inline int pm_schedule_suspend(struct device *=
dev, unsigned int delay)
>  }
>  static inline int pm_runtime_get_if_in_use(struct device *dev)
>  {
> -       return -EINVAL;
> +       return 1;

This should be return 0, as we did not bump the usage count.

>  }
>  static inline int pm_runtime_get_if_active(struct device *dev)
>  {
> --
> 2.43.0
>

Kind regards
Uffe

