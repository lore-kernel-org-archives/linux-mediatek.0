Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33AEBEFCD99
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Mar 2026 11:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A+vqi5yNfETZAao574uaaCl9A1rW1wYUCbmkQ0a4C8Y=; b=pzfd1mBORLdj3B96TXnmXzeECl
	qc2ph2pPHLH3VuXrACyZMwvz17u9BPreDgSL4WQFI8Is65MZJ7pGExaJiop4sIWIdpIbloC9mFi6M
	vxUBy/5TWDCE7Qr9QXs+iRDtfBw7IXg6Wf1hnY/n9xYk3MMc41wim30Q8YHG+Go6jKBVdsRFBwY8P
	99wDye4ncHYPV0hXTb0YZ8/HLJobHmAUae6UGAe2K/iuqKC5G23pbvyY2zikzQ+bSldD3RWMprydb
	iz9ritghrMrE4ocT3d+K0TZ5U8OJ9a42s59weZK+mOkXAVU1oW1PRUyYh1pejZL8GkyLjiiiy+OW/
	lJAi0gqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzYTL-000000078wD-48RV;
	Mon, 09 Mar 2026 11:08:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzYTJ-000000078vD-1Xxd
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Mar 2026 11:08:26 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6297LAsd2208108
	for <linux-mediatek@lists.infradead.org>; Mon, 9 Mar 2026 11:08:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=A+vqi5yNfETZAao574uaaCl9
	A1rW1wYUCbmkQ0a4C8Y=; b=Ub24Gv1Jn9nX9rjaOFOGcGwcZdVmHjStc0FyiSku
	Du3qSxRdTTmlVzYgQU52dkfNzEOykV6TdXX3XU2RMK5PpxOOuVmJnJtQTSSU3aQh
	YZzE5Y5YAOPSZz7lIVDB6OrQqEoNTkG7ubqqPSc695WGs8YU5Pf2motMQ+QZiTG7
	D1KjojNEENM+PhejSi1HkESscTsw9XJIGLBnUwRAt8QC8HearsmjoHY4RF7rJFkr
	J0HybVZePW1OirXbbHCjmvNavFwA67/oKKp+MPInfHMVdnJSDAqGCBVsPFAMRvGG
	933MqxunRvncA0CWlIIQtWPjnVk1jtIPVkCIg6XS4I3Ygg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr9cpndfb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Mon, 09 Mar 2026 11:08:24 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c7396634bb4so13164784a12.1
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Mar 2026 04:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773054503; x=1773659303; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A+vqi5yNfETZAao574uaaCl9A1rW1wYUCbmkQ0a4C8Y=;
        b=jXVNigRDqylKJISNdnVuS2mzxOMIq37PNgZxYdzskib80hbWbn7T7FY4DR8UvNAm1F
         IRsVX6iU9jObayGWiYwJ6VRSAx/UYrYg+7g8Py7vk0HFotyhJu4N5qWyPG/JXmx6hCAt
         c1P6aq1vRQ9MZPBqJlwhMTXH6G6nPrhVA0+pjKLO0Fv9WEitN3agLFG8mZnd2EN41vyW
         LDFqdENo1Rqj8oSel13UzsIm9Y5dxILhGq8ijqWp8oq6awh5q2VK8EfCufSmCMMnMZAp
         f1sEY3I6SN9sm779DRPYw4Pip6LPEEqECerbNgvaA+uWZzxWGnJ2c0quD/Ks8az2JUlv
         x1FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773054503; x=1773659303;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A+vqi5yNfETZAao574uaaCl9A1rW1wYUCbmkQ0a4C8Y=;
        b=WTMm+OUlaJm59x2Nmv80K7Og+QLBU/w8JlPhOBrg5ld1UQ5GAsO5qYXn0lByz6LS+q
         NJk4dOhcUb56oBaJ09X07u0iroLKPIB1gFbStjzBhLiRZRNdeJFuvuYiUtComU/ofhVC
         SN8d2tn2HNlpghlrSYTGHYmFOWAw6x/yH+RSNdCynS8qkyg0FxaBzVNlxxQwsNhBIDq4
         wQSbU8M1VlQEZIHAc155S/1AoSbrzddvZ9wj5HfMIdhO4xprYEURpfqebLcGcX4rylEy
         VbD6regBkdT04E9p3qKS1kKQYOnFCFpdEr05KqOmrIMNxr4PuAnPee4aPNwLME2eGXGC
         4mDA==
X-Forwarded-Encrypted: i=1; AJvYcCUCIn33Sm0Ya75MsiHCTqj9a/K7XQv90unqlT+5z1ZpWijQmPfiHfBnnZXbrxmlLroDZC/xB4+ovgJZKrwDTw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwmENWYogNuIjxFv63DTMyJc9rDlz97Z3BaQa9N9d+Q/1tGE1KZ
	5vnJjVtX7jR/Fes0F+FiJHuGSeHIaxuP7TiqrrSk62k/vg3427h50jR6p6tHS6N+DEglnZyWAWD
	1vPIFv929EfIrYrdw6dJW5eWMCF/05C5P9xeGmjA2/6bL2vdgAGBccCa4UWAS/hb6sv5o3aV82Y
	0=
X-Gm-Gg: ATEYQzxqZaL/xMrZ2gcO75uYV1RKGOb0Yby1NWsDuXzpqRvb/V+KoUNgC5fYAhKkxnw
	O7Q/Z7LrKqEgQUaNXfWT3NJOsxDH9/kRJx4WwKBNtwWeMOXEthFdDOOdQbZG4gHBcAM2XopVb0E
	NNCNLx/5vA2JycKyPKCGhI6yDZdhHavNpECk7LbP9mzwNgkXnd5LetFwwUkJxDYP15CyFwXEFJj
	Pbhnlb6JBJqbAecD0jL9mJI1aYYp8PDxVo0gbogyBtA0XgJrGbzT+IpBXCmeDXR6jfGzR1t3B92
	WfoCRmXh1mDxLQly6FhzKpZRUyneoRvBDsHAV/Le8/XV/Hsl/ly1e978BXj4UXvLjeS8q1R26Nz
	ArDbDyiwNfhanxZXjcd4SDea/5jmnUfZZt4Y=
X-Received: by 2002:a05:6a00:249b:b0:824:4a22:ec16 with SMTP id d2e1a72fcca58-829a2f142fbmr7232872b3a.34.1773054503051;
        Mon, 09 Mar 2026 04:08:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:249b:b0:824:4a22:ec16 with SMTP id d2e1a72fcca58-829a2f142fbmr7232839b3a.34.1773054502566;
        Mon, 09 Mar 2026 04:08:22 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a48dfc17sm11868886b3a.64.2026.03.09.04.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 04:08:22 -0700 (PDT)
Date: Mon, 9 Mar 2026 16:38:12 +0530
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
Subject: Re: [PATCH net-next v2 1/7] net: stmmac: provide plat_dat->dma_cfg
 in stmmac_plat_dat_alloc()
Message-ID: <aa6qHFVdQ8pvDb+d@oss.qualcomm.com>
References: <aa6VEsmBK-S9eNYU@shell.armlinux.org.uk>
 <E1vzX54-0000000CVrw-2jfu@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vzX54-0000000CVrw-2jfu@rmk-PC.armlinux.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEwMiBTYWx0ZWRfXzQjyG8N2WMLV
 Ez13qKwDixELcCtVZAE4NRCmVZTMYiKljB41vYb4UnNxxYgatgRRcuwD+NQxTCzVAr5XeilSEU+
 n+2AcG2r8bBbAIuNhQMIjYt6HHrckDfz2l8XyaWuvfAKZn8CN8QrXGhEcNnYF1LApla1lYrGV4X
 5Up5E5ku5PmZqtf0VhlpKs24vdlwm9d9Rfe49Dv+bNdyDsiT6eUUo69HMbwkgWcX3KKeGUc4Dhs
 Vki/PSvVRvK6jnZB1iRwFeVLD1HN9+XY05jylyZy1xotu3XIzqjaMapcMkxfxynTqqsk5OUkyPK
 5/yu3nxxQqzarkWohcXa++Vh3rymF3Asqo6+1C1YNhsQRILbZjJ8sSPm+l4XhkQHbMDpUhiql4Q
 5foeQTsUqWBb7br6kopa6sXMk9gIcAAps4bycNScc/0DlToOWidMiLD6O2lbFyUJJVQcxh5NLHz
 7cUA7VGlyJDFW3hROqA==
X-Proofpoint-ORIG-GUID: 9XNI1B78Yw3pleBkGo2LM9XJafrkTZfa
X-Proofpoint-GUID: 9XNI1B78Yw3pleBkGo2LM9XJafrkTZfa
X-Authority-Analysis: v=2.4 cv=e7sLiKp/ c=1 sm=1 tr=0 ts=69aeaa28 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8 a=EL_Z8gHO3nUhwFgt7b4A:9 a=CjuIK1q_8ugA:10
 a=zZCYzV9kfG8A:10 a=x9snwWr2DeNwDh03kgHS:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_040825_589700_BCCBB2F8 
X-CRM114-Status: GOOD (  16.03  )
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

On Mon, Mar 09, 2026 at 09:39:18AM +0000, Russell King (Oracle) wrote:
> plat_dat->dma_cfg is unconditionally required for the operation of the
> driver, so it would make sense to allocate it along with the plat_dat.
> 
> On Arm64, sizeof(*plat_dat) has recently shrunk from 880 to 816 bytes
> and sizeof(*plat_dat->dma_cfg) has shrunk from 32 to 20 bytes.
> 
> Given that dma_cfg is required, and it is now less than a cache line,
> It doesn't make sense to allocate this separateny, so place it at the
> end of struct plat_stmmacenet_data, and set plat_dat->dma_cfg to point
> at that to avoid mass changes.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan

