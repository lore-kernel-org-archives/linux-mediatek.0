Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4EDBD0C84D
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Jan 2026 10:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9I4JuA+DTKrsxAvgGNBrZD4ygy6kYD+KaH47v1t+hV8=; b=zSu2KOWcS5xmXuX6gsHwQYX0SP
	yCl2/xWdW9tOhn+XokGOR+s+c80L2in2j7Wf7P2mvDJ4QSDzlQmoE/8dQ3U8QUmbqUj2U6jSYTXhO
	MYjIcngxImwj74gJfd/jBmtABpxv0lq5Iz9buBxIZwkMhrtwbsQMbRrIB2iufD2N44FLeZ72RzO9V
	pM3IWcNJkh92U0mlUtjYRFKrAtN0X3U0E1eb34NEYYk+CG1lGojNdC1R8MrK3bkyuTobN2DPDFI1p
	yP+tYRCdhhPUMb3RMIMHsInLYk6SrH65/K+XQiho6O2AtH4MYrJmiwjrzKZ+Oyw8ZWE+M4p7xkCdo
	HUrh8JTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfbtv-00000006vka-0bDK;
	Tue, 13 Jan 2026 10:45:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfbtr-00000006vjr-3X8o
	for linux-mediatek@lists.infradead.org;
	Tue, 13 Jan 2026 10:45:25 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D5397u2865826
	for <linux-mediatek@lists.infradead.org>; Tue, 13 Jan 2026 10:45:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9I4JuA+DTKrsxAvgGNBrZD4y
	gy6kYD+KaH47v1t+hV8=; b=c+6tHYd147u6Z9qI8EDeKTvgvPrWo6o2hDXsE9YK
	f3CVlzV6eSxPAc4sgRgM1FqE+EwTKvHXXuPH4byfc3LXUevwVs953j2dwooIu1XP
	cxTak+/YTgi/RX6eMaWNIcYC2Me08b7RxyhMjls9tEgEl8M71xjsjLydFGcN6BhW
	xuH/wQ+XrP/5NlA2AZASkroPaSkhb1EJiUFL2CQp7F/MoUEmlqI8XnRV/uMUUAR3
	dUvYucDqzYvBHqiQPr8Ip0SIxWdRTCG9WcDT8xb3ZRBZ2bszG6PgBhKriRxQ5lvl
	5jdwc81/0m6IJyGYI6KeMza8aVDmC+4oYepw1FGXbRKE9Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnfjh92r6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Tue, 13 Jan 2026 10:45:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c52c67f65cso33404285a.1
        for <linux-mediatek@lists.infradead.org>; Tue, 13 Jan 2026 02:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768301122; x=1768905922; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9I4JuA+DTKrsxAvgGNBrZD4ygy6kYD+KaH47v1t+hV8=;
        b=A0FgTfXY3apWpU6A3iRXUxeCO6YqrL1uRz9jy0W8MVAxVHXGiUSk1TJn/huSplCdX0
         Lc/gF7D+rHSm5Baxi164AQakMGm3gm5xE5YhFbMJa3nTNjGlYblgPJu5DIARBNT/8/q+
         teimtm159qQYcKcTlbw7gqqdZJkXvEhY4x34QJbsZYzxeJAxJTgPo4uYVPPZRqdJ5bW/
         ygJUH17ozL0ZqpPugRbYqSAD4WzBaQhV0yrDpU0Z49fwvv3lhiZ2C94BFGH8CBaaTYtO
         OJz5o0/6uTo7DNA+XXq4GFrrC8VGzp/ix64CpNaE4eECSUtM/ezZQmu7KxM71GJF39W3
         QXnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768301122; x=1768905922;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9I4JuA+DTKrsxAvgGNBrZD4ygy6kYD+KaH47v1t+hV8=;
        b=DufA3fsV8actCTFfVebNOZMAcWKMzm34Le/QHWIyUfjRACztmk6jO7Y5wZRR7mBA5d
         4ESKvjaO5JnP77PUINOxS4shSR1NorgMoBDqZ3sQ8KgaSZj//9Yei3tH2TvJdcrcFq2w
         GRYzBVqdD3rHtHnE9KQyBzYdU18HI2xTOWP+cTcN42eUHSpLs/6XvzpwIhKclXTQrQa7
         6FosNcssQQH7GCaA6M4pHijjkEeKrT5atDYN1Sgd9SgWpHQU9eQs/coBlj36GrMYBJl4
         +fPfDhUtK9E6MpfGHY+KcgON/NOPO/9eiSECIcMl2BdHer0j6jH8OTCgUPW+nsT1I4r5
         Htng==
X-Forwarded-Encrypted: i=1; AJvYcCUrxQFYJk5gQTpVfJfjxKaZ9zsKMmiKfAM9vFTX9VwpARXqZfnOMIi9UypyaNr3g/ua/9huR+3JcLFjYdiV8g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4l3s0LTgwThtkDxgUkpF9bNO4k9C3iMi04HCj0fyu2U7yfUd4
	aYFmVG8bQRwYvCPdOCQ9pbvW3IHcJJvyXk4knQDnpA5i4hRhw9i7TFVX2TcXIcVrE8KwJHrINlR
	0apUtOXtFJMZM+pPl7/xigtFmkjNt7olLScsZj0eKkFeUJD0MjVvKzzit39zNCoo+d6+MVDdujn
	c=
X-Gm-Gg: AY/fxX5sDN5aU4YS26W4/Sk1sSNQwXnnmfKmxvQsFu5HFl7cJljkMX+ipB8gGBmYqiu
	nh/C+CXsXYHdBRk632TRyhjILlXL1Q0B3qHqkG0AGq/HK25O5IChkA3VGl2IapgcGqOeZklfBCp
	AXYtklQy+GidG2AnQjOACO45bniOlfeQryS+6J835pNDAEfwvdePwp/VEV6HMmr9aoQ9omzZEWV
	MtRTY0+YbQ5PtlmeCR3NlI31Yhv1m+LOEhHVNsvo2wWIktMJv44Yu+8kW7QSx+X6xaWLRWo2j65
	JM9V50gPar/9amKcWX/pp/KQPrPORSpKSxT/FNbx4wS6qlJB53L16EI3PlT6fICw9EIfA/SuyyT
	WzOMgr5pVU1H/4BH3+HerBGI1194HOoVIvrbkTBYi+fDL+VUOlQJTrwZ0x9en5j8mPJmwlhlUJx
	oe0axQZyJN/A7homEhulXvR+M=
X-Received: by 2002:a05:620a:4620:b0:8b2:e8b5:1ea3 with SMTP id af79cd13be357-8c389396ee9mr3113899785a.28.1768301122141;
        Tue, 13 Jan 2026 02:45:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+v5i4OzVytG7YmTzOdtD/BVcyfWkUol5gVPPJzVXwcGpOBqn8M4DeV5yIFPElPgFt6kFirA==
X-Received: by 2002:a05:620a:4620:b0:8b2:e8b5:1ea3 with SMTP id af79cd13be357-8c389396ee9mr3113897385a.28.1768301121697;
        Tue, 13 Jan 2026 02:45:21 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b67b51b4csm5404992e87.19.2026.01.13.02.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 02:45:21 -0800 (PST)
Date: Tue, 13 Jan 2026 12:45:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Moudy Ho <moudy.ho@mediatek.com>
Cc: linux-firmware@kernel.org, linux-mediatek@lists.infradead.org,
        nfraprado@collabora.com, Jason-ch.Chen@mediatek.com,
        angelogioacchino.delregno@collabora.com, Macpaul.Lin@mediatek.com
Subject: Re: rename MT8188 SCP firmware and add symlink
Message-ID: <3imlk7gitfiazewwrlottwnewfn255othxe64ui6jvusz5akjs@r2tmsrx3y3xx>
References: <20260113094541.2528905-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113094541.2528905-1-moudy.ho@mediatek.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA5MSBTYWx0ZWRfXxDnxno06Xv4U
 8GYcaUUGKdcys99SjqfjPm38y5bj3zFotGLG1zKRokkwiOTeXnyzW1vmgqpaQtJweyiUdA/pdFM
 lTszV+D174ScRdgBxWKzXQwHTd9Hucjcq9gsyaCg0P7KFUs/q/gK6JN0Z3XoOsU0iWxOI1UzjeN
 ySm/mijjg8ZoUi9TvS8MFHkVMZfDpY3USEg0vLz82sUzFG39MMvlbHJWdjPKyQ4s6nfb5KfafFU
 b+W/eMQ3WOKPImdK7R+x1mbKmo5L3KlXocapguHIdqh48P7RKhB/1wcW8KvOTWo79bWjKwryGeJ
 Kgct2CIiJbVvZ8MUJ2D15/2fGAH/xEqayb77wj/r5kQPDB74gsNjxhMdAW+vkKk7HUX4vqes+q3
 japb37JnqfF6crCgXjrBqWdoIdTvX6YUQ5oww2E4ORcxJNQjlsQzA2aJiQCjw/Nk7qnpA6shsjc
 uR5/GMKOaESBrwzEl0w==
X-Proofpoint-GUID: zJURw5J1-YdIGfLZinohfjknKcdVZs04
X-Proofpoint-ORIG-GUID: zJURw5J1-YdIGfLZinohfjknKcdVZs04
X-Authority-Analysis: v=2.4 cv=XJQ9iAhE c=1 sm=1 tr=0 ts=69662243 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=QJzb6Ko3GgTxAw7dr1QA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_024523_978836_4DB48B6E 
X-CRM114-Status: GOOD (  16.31  )
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

On Tue, Jan 13, 2026 at 05:45:04PM +0800, Moudy Ho wrote:
> The following changes since commit 486ac8f9adb4d77b951b55179985c6b3c20b6957:
> 
>   Merge branch 'robot/pr-0-1768198342' into 'main' (2026-01-12 07:14:40 +0000)
> 
> are available in the Git repository at:
> 
>   https://github.com/MoudyHo/linux_fw_scp v27748.03
> 
> for you to fetch changes up to fdae06e63ed75fa3a91c8fab7a88c7b22c12ec3f:
> 
>   mediatek: rename MT8188 SCP firmware and add symlink (2026-01-13 17:13:26 +0800)
> 
> ----------------------------------------------------------------
> Moudy Ho (1):
>       mediatek: rename MT8188 SCP firmware and add symlink
> 
>  WHENCE                     |   3 ++-
>  mediatek/mt8188/scp.img    | Bin 636548 -> 10 bytes

If you have Link: in WHENCE, you don't need this file.

>  mediatek/mt8188/scp_c0.img | Bin 0 -> 636548 bytes
>  3 files changed, 2 insertions(+), 1 deletion(-)
>  mode change 100644 => 120000 mediatek/mt8188/scp.img
>  create mode 100644 mediatek/mt8188/scp_c0.img
> 

-- 
With best wishes
Dmitry

