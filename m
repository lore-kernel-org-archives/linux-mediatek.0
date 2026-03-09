Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED76EFCD9A
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Mar 2026 11:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9GcFU1X0YgGaDvQY7T0H3DK56rvaH9tLv7mLbV4BabU=; b=ZDYBECjNIExQtHuNw+qh/TeC4s
	ToG/mO/PojOI45PWbuA6E7fZcu+N/HjIOXb3PjMcgHrX4htGm1/u0efpFPf3VIl7JS9jQJT4UMCW0
	kHqE2jSQBYITXgDiXnIgAEbZP0fFyY28IkM6rRjxo2pnqKFTT3P1VZiA+ovCGvysFAkCYGXtiAILd
	5FEYpaPoSfH+diJPRlhJ8ez37MGurMLfxOOtDqjfxYHQERh3ClPc/n0AyqmJwKpbvLW2vd0HGv4pj
	KQ/RsFOvpaB2E5t0wKQwImHGtLsQec7p2xzmgQ9sGJlBzKXB4bqvVJoTgyIb85EJbu6+9tINNdh1Q
	/dtvNKZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzYUT-000000079Cd-3KQ8;
	Mon, 09 Mar 2026 11:09:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzYUQ-000000079BM-2K1a
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Mar 2026 11:09:35 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629827VX3051928
	for <linux-mediatek@lists.infradead.org>; Mon, 9 Mar 2026 11:09:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9GcFU1X0YgGaDvQY7T0H3DK5
	6rvaH9tLv7mLbV4BabU=; b=PqCeTolUyDUnfQtvNv37mNjqVxegnXKUYob3z2lG
	XphlgQjhQnMquTaJQt7KF2g+f5/98CZ3ail8ZOhukncqxq5WKInf2DZL9bnftxgK
	/FYGhtbpYUYQbYqm3EjwwYAMvrOu1i8U+leKtQFkxaUDN+aC1PDvV/qUzLX4k9ij
	wLYuk64n7KpwuMgkHC+219t+94GHSEewV+gh5CQRCnjiKdv0/E6b19TciOUlCtFR
	wxYLt6veXcikC7E483Dm35micc3IxfR3E46Up/kypL1+Dz4Hm2pbHv4b0uIlCnOI
	4oRIxavDO5KUbDFFXCQlzUd19z0kDB8yAeimdXmFgxkeXg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr9qewewt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Mon, 09 Mar 2026 11:09:33 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-829b7ed8964so919125b3a.2
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Mar 2026 04:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773054573; x=1773659373; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9GcFU1X0YgGaDvQY7T0H3DK56rvaH9tLv7mLbV4BabU=;
        b=H3RLJiV4zvuWrtTPB6cf7HktDQhrJtCPXjte3QBmb3ixkfN+Lh8iMymmRfJMGyFfCt
         V+OMlJ/BvAROsHD6HmBAoGvil9593lN4KX58ymEZwhLYrEsfFlfBg1Ox1sgq0oOllQrK
         cDp32ifdHjHgdvO1qnAhBzSm3FyA+ZMvLy1J1L2iaHYMnlC57/u60LsysyqYc7Ec43Lz
         +YWEuEQU00CQ8nU7JQ2KdvrpnxLqNE0VEzyt/yzLGeNK7k9kVtGzhhkuvQEQ/+yo5YDc
         o/M8gioX7ja6djh63n4olBcxgwwirkaB8UwXyM0WNP7Sa5kS2mnd+ONE/1FdirhTicah
         pM/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773054573; x=1773659373;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9GcFU1X0YgGaDvQY7T0H3DK56rvaH9tLv7mLbV4BabU=;
        b=tWtILwjm/+RJIupYi2/3OTXKBgmAko1qeoB/lNo7DvHW2TH+Zdn5lsDZdioQCYdVES
         unTey68z73puHJLhb8zqockeOYG5mQVcmogE8573AiGSybiB8MSs587Yhts88JAGlOVO
         p8EggSNLoAqBYMqTJ1MuMIrdrHsQ2PWn2wMU5LjrMkK3i9VL/SG8ebdKqB9qf8BKiymx
         pQywJxmRPVKm1N9hRQLFt57VsdqMfve1Yv5kPlwJfuZoKlr00q2FCQeYrATKuNqAlwV9
         2OPLV+YNPi2i4l3lBN8SNcHSO6TbRqdzWc11iUTd0pp+1upUmhs8tb66RcwwA5pAzUOL
         8XfA==
X-Forwarded-Encrypted: i=1; AJvYcCWYvyPd+qMaKTwvbWHoF/vCx6zYN5Vpvxw5QJNA6tg8hoTDpLl0WSetSXZWTwF6FRvJs2t+JuwPvb3wAH5PdA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxVSBSMVk+VgCBzWxs+s0VUJCUpDUrt3fcrWGWGq7jPr4fzMTmu
	nSYr9Ufkcdenc6qeLSyUzjRGpcAuw+lnXcwQNPoXZPo0ReZDEfHivO+zNOkxy7/MiTBnzRUx+ul
	kfyaEh73l0SuwAIGPBcImZV8q8XxUTtAY0mY29ek9JFcxAs+rA9Qn8JMZ6SaGsiGD+yMSdpFqXH
	o=
X-Gm-Gg: ATEYQzxr/chNP+ZPbhS4z9RqqkwedZtOAAKet/GAehn2D2pJAT2bMeJEGgxnD8D/knp
	jTeO1fnsfIgwTO/zudA+VRqPUWPxIV51bESPsgsQF7zaxIe63dcoQnn2iT9Hddkw7ghRun1AtL9
	7inMQ6XPlnUDlweTdDTgUiyWQpvAAhZLbNPvERiPQ7gAWwd/Roz2raObb3G5nKecHnsqwqJr7GR
	8X0XNn540oLcqSDGdexOk5NTXSIJyU/rP7A5mRG4cQrEWsFikZJhOTWdmumMNrJHl7b5irHSxgk
	qRaI5XSeybkbKclsIlISqAWUAKTZxHe8DxG7oEG+MaZ9QpIx90T55FdPC5LLFjDk09ZUy3jRmXj
	PeezEmEyc2/bd3UhV4Psm1RsXaow90eMX4Mw=
X-Received: by 2002:a05:6a00:3022:b0:829:8e38:65f with SMTP id d2e1a72fcca58-829a2db935amr9010419b3a.8.1773054573142;
        Mon, 09 Mar 2026 04:09:33 -0700 (PDT)
X-Received: by 2002:a05:6a00:3022:b0:829:8e38:65f with SMTP id d2e1a72fcca58-829a2db935amr9010380b3a.8.1773054572661;
        Mon, 09 Mar 2026 04:09:32 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a465b6f7sm11967292b3a.23.2026.03.09.04.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 04:09:32 -0700 (PDT)
Date: Mon, 9 Mar 2026 16:39:22 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Frank Li <Frank.Li@nxp.com>,
        imx@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
        Jan Petrous <jan.petrous@oss.nxp.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>, s32@nxp.com,
        Samuel Holland <samuel@sholland.org>,
        Sascha Hauer <s.hauer@pengutronix.de>, Yao Zi <me@ziyao.cc>
Subject: Re: [PATCH net-next v2 2/7] net: stmmac: convert
 plat_stmmacenet_data booleans to type bool
Message-ID: <aa6qYo+1san7jL/7@oss.qualcomm.com>
References: <aa6VEsmBK-S9eNYU@shell.armlinux.org.uk>
 <E1vzX59-0000000CVs2-3MHc@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vzX59-0000000CVs2-3MHc@rmk-PC.armlinux.org.uk>
X-Proofpoint-ORIG-GUID: W4nxV-SAU0ysAmxp1D6IICRocE7WyvcV
X-Proofpoint-GUID: W4nxV-SAU0ysAmxp1D6IICRocE7WyvcV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEwMiBTYWx0ZWRfX4/kfY/OffGFd
 D83b8pebsWN2JFway2+8ffEmMQ/REX3VNH/swOUuLQ2Z2HUQAoGAY1ZcRaqt9n/oU0u1wBBxjaF
 UWoWFSZcIZl/2OVk+dBlMhcrY+vE3hB8MRd8NBDr4bmP4T5ulDm7xppDAvyA9j7wZPt/8BqqYVL
 7QL4N6ZL856wSnOxbBWA1LtBxm3wdK2Y8j0bPJrARNWrayCg1RbjCD2U6g+yWuMC4nx4ovs7GlK
 b+hNT8vRVsEcnKFdUbpImqhEJw8WNblN6NBdm8ExoHqs1ouanLWh9fTaoXFwTftzgUdpLidVAFI
 swz5bSgwVqiQ9EABAWVzLFOZi+pLMkTogrKfRwDSaZZXBodBazUTchvlQhTZaEGC1IE6mZhCTPL
 q0pAeWdrsyAqnNWV7pCpFD+LIGwyiecJvYfR+HOlshV/pJUtrNvgF2NT1Khz+NGTrEQdj/+vlh0
 +AhChVBwh3hkaOYG1DA==
X-Authority-Analysis: v=2.4 cv=dcqNHHXe c=1 sm=1 tr=0 ts=69aeaa6d cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8 a=91TNVAZHAA1vfZ95losA:9 a=CjuIK1q_8ugA:10
 a=zZCYzV9kfG8A:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_040934_593548_83CDF09E 
X-CRM114-Status: GOOD (  12.52  )
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

On Mon, Mar 09, 2026 at 09:39:23AM +0000, Russell King (Oracle) wrote:
> Convert members of struct plat_stmmacenet_data that are booleans to
> type 'bool' and ensure their initialisers are true/false. Move the
> has_xxx for the GMAC cores together, and move the COE members to the
> end of the list of bool to avoid unused holes in the struct.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan

