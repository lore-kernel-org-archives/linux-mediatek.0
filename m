Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CAC5D31A09
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jan 2026 04:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8uHkowW3uP14kSwNKsH5Kv5eEgkm/mZq3hluQMB2+l0=; b=SFBKWKj9ytGiqlB5BKCFHZk24p
	1cHIcQR/UBvQoi5Iy8ddu9ZNGYYgNjwHZ8275cQUHv3PtieXpb9x1brsxVfupuVLugck+EN1Jyac6
	drpC/ENX9dtHH3yUvM+YhIThFJj+zOqR3nu7IILaW5b5CnReoX7dL7wZ5qzHxC3EDc7Uei0m5GtO9
	zjU9ZlaMuAx0j14tCOWTeFCCkKP44u8nZPlL1DJJxDmnJY5RZQglp3GxfJJ/n7LU109O7ZCL/4lUz
	LIO5P8J57Z5+S2/e77pgly3zAbUZiQCu6Qluuzil2eIZleJ/Thi8nXWMha+pFuLLJFkPFtlmwK0K5
	LLiucfRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfs7A-000000082jv-0UHU;
	Wed, 14 Jan 2026 04:04:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfs76-000000082jW-2Uey
	for linux-mediatek@lists.infradead.org;
	Wed, 14 Jan 2026 04:04:10 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DNHaDg1015856
	for <linux-mediatek@lists.infradead.org>; Wed, 14 Jan 2026 04:04:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8uHkowW3uP14kSwNKsH5Kv5e
	Egkm/mZq3hluQMB2+l0=; b=QPvJKoLE0Eh1xbq2DQShV2wM1BITjHhSqOFdoVG5
	T/dORBjLj8EjyF/aktZDMep5WQgb4Malbxl5VzR9Ej+hMhOZH+U5ASh9HxVA0/jG
	D3sFmXd4/H2fYgCUse5tkaFusb43Bhimeiwvh5UWWTYQG9NjzkRUX7IisbP4VcS/
	GLW4JdVIV6uxctLimlA7qfohiC5/yxtsSTldxNgWOhfkpmARYVUHe8BN/6nmSyX5
	wOH6/2taMGra5JoPaBTJWIRWhomR708UE6YhmCZPknDYrALOx0CjmwdaqSJhtwzJ
	8AqywcAzEitLks3YelIJKubfkbyKkodI6Idu55dCcXzdyA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnu58smp6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 14 Jan 2026 04:04:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c52bb3ac7bso167028785a.0
        for <linux-mediatek@lists.infradead.org>; Tue, 13 Jan 2026 20:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768363447; x=1768968247; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8uHkowW3uP14kSwNKsH5Kv5eEgkm/mZq3hluQMB2+l0=;
        b=KpAeEkU1LGI+lwzCMeFnhx6Z0lMjceZSvikfaAEW3qt8e/LzBYEl/+bwuZrxIpBxxp
         UbUTiKwnu1mHMVQPrOJ1v3MiPvl8ngctoE8Y1hn4iJUGGgHRIPh3rK+tAMHNfAGThOBg
         EzrtI/IdebgIzZpuAxfg7+1aPsFZSJvT4gtVWUFjRz8EtQd6XNIbFdwei2cR8yvL/0Yt
         agqXMxBrbon7jKqqMTEJYFsYN2LAJ5QrdIK7pbrJdEk7Ho0JFHg1phAPMEMqIJS0UpB9
         tL5W+88bwZqUoWBxUU9MjshlDwsDNfiZbffXOV4PnwnwJzC/PTODGKVz6tjGZ3Es8xKv
         Zw1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768363447; x=1768968247;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8uHkowW3uP14kSwNKsH5Kv5eEgkm/mZq3hluQMB2+l0=;
        b=JEh7lMjiyJvFLk3k8hGDGXcrEaWojQQnsYppCmYvXjRqc1jrc8m9bB/aDCxizVpNOJ
         pGKHvokrXM6+mMVhqrvUYSCsIozoP9JolD6lcalXSYI49/At2tm5w8hc6WlGfUtFduZn
         DIi+Ktt7a4AbVnthK5x4lnRmBwUdyXVXG+NNCOpkBVrjkWkuvM+kWNp8T8GyF/D1dbbn
         76fOYHNc7gB9dPO5EW+nj6RaLvdNS9IcPVRkzkrDaHPcDKr3ZXhNbGLwNYzZIV4VJW12
         VJyICQ0kPnWENa0+1cTJG+qiwL9piY+gcHN0C10ZdhxUeyFiU3pa8LnV1wYaNPLkNb9y
         wgGg==
X-Forwarded-Encrypted: i=1; AJvYcCVxBsESMzFD/9HXPpgP1pChuWrPZQ4F/dLZF8iHbyx2IDNzLEOkZ9fvYA0cGkonJXE1aoQQxxKYQ4HJdyO2yg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwE1qWwJIZ0LENqrFPbp8ElDx/vggPi/qMKzwxhg5oNmmRYhbqw
	DBIizFxyLjwiENnh6MAzNsFfyZRSWcIQyuxzKDDRedGa94gFMERMAFvLmKlpuYS93czMmh88vyg
	h769oFfLHcM0yYOzBo3W7zAzSmAISba7juIGHimhCYnwjrlBUa7Ioip1yPGx8z0DO2VtKcX1lqX
	E=
X-Gm-Gg: AY/fxX5FsnKaZh6QL73EcAtxlI7rqB2h1cAsbKsFP94blTRp99tdOOwyPb0IuVDNfNR
	UjxdXiPgTwpZIQkHTuHKaNGknVhOiHcv5+u0pkQGuAaocXA4iV5eTr240nZTgLO6DwpMUcz4/b8
	xOTqhCVE8ywbkAfC7ffEwwhgcS+5+nmmKyGZHBXlShUzP6bByjWSrI61/EkL1CgvfjHGXMxz7rx
	7jDKsM8ZVoGpcjVLJXl5X5IgS5wbsX1MIfgcQkwMA+uLdfN2AWwiacStWuFQ2KHiYx+xSIC8eRr
	rYyFcUPXp2xIg0PdXuU5e9oLNGKdRb6P9dFTbBzqvYUtsiZ+3eq14NRfKHDADeOtab/Xrmaauah
	do+p5S3eA6QpMOAwRmzcTqSwsn6iZGB7MqHW48y/KsmZ90XxCbqx4/FNMuD5mh99S0nVdeIRtp9
	/QaL8mPkxsLHbJjmlEzGU6NBo=
X-Received: by 2002:a05:620a:f12:b0:8b2:db27:425f with SMTP id af79cd13be357-8c52fbcea36mr204430685a.58.1768363447024;
        Tue, 13 Jan 2026 20:04:07 -0800 (PST)
X-Received: by 2002:a05:620a:f12:b0:8b2:db27:425f with SMTP id af79cd13be357-8c52fbcea36mr204428285a.58.1768363446594;
        Tue, 13 Jan 2026 20:04:06 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59ba102092fsm304593e87.30.2026.01.13.20.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 20:04:05 -0800 (PST)
Date: Wed, 14 Jan 2026 06:04:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Moudy Ho <moudy.ho@mediatek.com>
Cc: linux-firmware@kernel.org, linux-mediatek@lists.infradead.org,
        nfraprado@collabora.com, Jason-ch.Chen@mediatek.com,
        angelogioacchino.delregno@collabora.com, Macpaul.Lin@mediatek.com
Subject: Re: mediatek: rename MT8188 SCP firmware
Message-ID: <3vphktkj4jv4dymnorkruxxyayivxn6e6n63sl5iweo4jh7csl@5audwfacojyx>
References: <20260114014131.2933478-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114014131.2933478-1-moudy.ho@mediatek.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDAyNyBTYWx0ZWRfX25os+T2266Ce
 hxz6N9CDC+AZFA4CNzV+fsP1bxg/bAOhaW8CQNvvFYohKjSLkuk4SlJ29RxsIGp8MVwqJjB2mRP
 u5ADcsHInge9Kqc845BosuAa130rvvwvlnN99WtARWA+OfSmO2m45dudODq675KCMn5mK/d42vZ
 GFITFgkCE7fIbA6e9YS67rHwJPjuAjVBNjAhK7JopUsZ0vj4drtFqrCyCkMR32lc/mrJ0kd/qHx
 CzCmU7J0/IQg7ayIvNwn/gbeB0CE3Hm+A/kZvo2YkRV5L0kPBS5duCKkeaQgF9HcXJ/f7kVZA2X
 VnK/54hy5lXuialJmad0CFGJWG6bY15zHrz6W04LH/Fqn2uC7m8oD/pBTmyEMBlE7a5BUzbw+j2
 G+2x8KtNEWYJYP/PBIymfRWItBu/COl2Wd6pLJFCCmvZ7IxBf/Af9oVUzTDrJktDOs8YhIsSVED
 ADfowS5OJatTZdGTM1Q==
X-Authority-Analysis: v=2.4 cv=BZnVE7t2 c=1 sm=1 tr=0 ts=696715b8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=q7cfFwRtAvyWHTVURH0A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: IbwUlyx7MuqJiClbZm-0KyMe0_dxXu7-
X-Proofpoint-GUID: IbwUlyx7MuqJiClbZm-0KyMe0_dxXu7-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_200409_518989_DB02DE13 
X-CRM114-Status: GOOD (  14.37  )
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

On Wed, Jan 14, 2026 at 09:40:42AM +0800, Moudy Ho wrote:
> The following changes since commit 486ac8f9adb4d77b951b55179985c6b3c20b6957:
> 
>   Merge branch 'robot/pr-0-1768198342' into 'main' (2026-01-12 07:14:40 +0000)
> 
> are available in the Git repository at:
> 
>   https://github.com/MoudyHo/linux_fw_scp v27748.04
> 
> for you to fetch changes up to a27572bc81d5073e8288c1b8a78903a8ae20478b:
> 
>   mediatek: rename MT8188 SCP firmware (2026-01-14 09:09:25 +0800)
> 
> ----------------------------------------------------------------
> Moudy Ho (1):
>       mediatek: rename MT8188 SCP firmware
> 
>  WHENCE                                  |   3 ++-
>  mediatek/mt8188/{scp.img => scp_c0.img} | Bin
>  2 files changed, 2 insertions(+), 1 deletion(-)
>  rename mediatek/mt8188/{scp.img => scp_c0.img} (100%)

E: target mediatek/mt8188/mediatek/mt8188/scp_c0.img of link mediatek/mt8188/scp.img in WHENCE does not exist

-- 
With best wishes
Dmitry

