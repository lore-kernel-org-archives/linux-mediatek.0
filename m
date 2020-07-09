Return-Path: <SRS0=UXZI=AU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 197EAC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2020 20:45:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7C62207FC
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2020 20:45:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aN4RUWat";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="NY+P7+Yi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="FvCFgIS3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7C62207FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:From:To:Subject:MIME-Version:References:
	In-Reply-To:Date:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oUt9AoNR6WmHzWDvf+ZeZeWX0DGWYKuXwar0I9J6IXU=; b=aN4RUWatsUG9SVXwv7/AU8hr36
	1UTtF4I8IVMHiMNIEBHRGhrfP7h5dhGb0BFJCz1jieZkxtRBMjTYBuZtciGPprwnkWi66KlEKnlKB
	sSeM38pq8VgsfXMUjFltG6bLRNOdd48iPxJugYUfcss6ImYQjlygdxZCJwJ+iHNPUyA+GWOUAUvlG
	tKj2HVKNhwRUdVGqyejUR86vY94yG7co1oTi7Ac5+GY56yfupF7UzPPF4LSIPOf9dlGsSb5T4PW+S
	VAjSJEZ2LT/FobETzLMUYWYkEWKqExJbpHpY6dvjJo2gPr77vX+GrePgM56QohPa9ZfSVdjckXjPc
	LQyIEgng==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtdPY-0007le-Nd; Thu, 09 Jul 2020 20:44:52 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtdPW-0007lF-6B; Thu, 09 Jul 2020 20:44:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Message-ID:From:CC:To:Reply-to:Subject:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
 Date:Sender:Content-ID:Content-Description;
 bh=2UXj/YT1X1xRE6iXdWnGBTz2+zD4QV71s7VPwzbW098=; b=NY+P7+YiFTXoh5eueT8Cmhr7sY
 2aJj3px+0QAv4HPTLedbWAptwPzsNQjLWd0Qbn9Q9TnoZ+930G4f5Ki+avhEhbZgbR1U1q2sB4i1U
 f5voHfi3QA+6SKd645xBzNlv390YI4/pz1NQBoJx5ZM5w/Xoklauy2tlNNGhcki9R2gEo6sruNd4W
 19Rhiwg6wM/6QR1K364tHlxNROu8okIsEUqW2DW+wqZ9yyhq1T6YVC0T6xC8+F8N/3iki5Bjn3hTb
 BUq/DplzBpYNnQeL2XhzJaERLNvq2aO1fylhiAdOaILyo52mFl8W42OwJByUyXHpqWYbaS7fod+w6
 HpLde8Rw==;
Received: from mout.gmx.net ([212.227.17.20])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtdP7-000369-Nn; Thu, 09 Jul 2020 20:44:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1594327452;
 bh=2UXj/YT1X1xRE6iXdWnGBTz2+zD4QV71s7VPwzbW098=;
 h=X-UI-Sender-Class:Date:In-Reply-To:References:Subject:Reply-to:To:
 CC:From;
 b=FvCFgIS3XHU45dJcgPI/3b+gEheV8mOct5uRqaZfzD70RDmEXjtzte8zOp5SvQA7g
 j2kqrccOlESgSaIwtJIEsdHEQczqYcAkjbG0NfBiwqYhlpf6kJTTVrKPzyKRn5RMfv
 27dfysTh2/7mAsh9QgBQY4PKhsMOtYY1YXN5AMto=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from frank-s9 ([80.208.213.58]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M42jQ-1jtdJ52PB2-0001Ay; Thu, 09
 Jul 2020 22:38:11 +0200
Date: Thu, 09 Jul 2020 22:38:04 +0200
User-Agent: K-9 Mail for Android
In-Reply-To: <20200709203134.GI1551@shell.armlinux.org.uk>
References: <20200709055742.3425-1-frank-w@public-files.de>
 <20200709134115.GK928075@lunn.ch>
 <20200709203134.GI1551@shell.armlinux.org.uk>
MIME-Version: 1.0
Subject: Re: [PATCH v2] net: ethernet: mtk_eth_soc: fix mtu warning
To: linux-mediatek@lists.infradead.org,
 Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>
From: Frank Wunderlich <frank-w@public-files.de>
Message-ID: <08A4F0A0-ED34-4FB1-BD38-0977C52771F1@public-files.de>
X-Provags-ID: V03:K1:h7S43N8I4FY0MTa+lsB0ECm63VvXcEgDY4fIR7I5CDS/H67dvv0
 yJI5IcRam4U4lWsr3Ta1+Oa1xvd/KII+gEkl3S4agBboYXBVuA9nqH4PIoWb7beeOYJaWwm
 T9ofk4Pey7aTQ71WubbVE2Wu6YWUhxyoRepZys6TpnvJtjS9Oqzu3EQ+gWIoBY42hgRs45Y
 t/XRuVj+HVg1BZtnAMWNQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ahubcRqtbpo=:lJuV9Pj1ObYr+nr1dEYIjF
 Jg473+xNv8GuezqqyZvd2JYw5Zcx4dwONIZhQCPhZNcLuFsDE8YZxOhyNdVJ5I2WayeURhzGt
 vLFXqCKoL8z7NEiHAkJOOEKWB8n6GYBorvVrock/aQYW5fp5GDyxUVong8bwddupjtH2IzgVK
 TPewou99gTiO9O54qaNIrkJ33T63+T94OKy72wlB7Xw7RsqKpurmFSNnTc3hEGlm6mL9G/egG
 rvKdtTbIhj1rhvZVsL+4euxJCyF39UlH3kFd96J/UZEAH8GBAO2VTXne/Lxxp0i6WiPwW7toQ
 bkybYG/bJR1XSFmRZMKyQhq9/tl2KBS0UZhQPRHV7hPtmNnOOnS9Bs+G6cvNSCnxY5We3PHhR
 0iw0XOxNA6Lq6Olcd8yYJ0EUYH0O0sRI9tj9dof5R1JUFwlSQPzlKK/kzWUqj9X86N+MZMr67
 gtFe4Nj+Sz2fh+ePuvPzvWx8Y72TuSlAIPA8WWmHdaX/7lqzgxCPEs4w9cfHWF5u9oXzjEr8f
 vPVU3JQDtneZuTbjg8uZT2VL6wkjggjjoqxhlgw9HcrONmFCMi+8HYu1KDVcdLHyVk+OsQ/WV
 Ll4jUbnTaCN1mIWNAnEh6Ac7n9KJp5oq+JPYL1FOUQBhHnriD7wVozn5JPIqlnhZWfUhbNtVc
 pov9uFJA0WLp/q1uWPdUpDpcaPgwtVM5IiTI11wqN6/NEv2hTLqPu/qJWDJsgvtVEZ4Mhmqyf
 Q1N9Z/pASQJxrw0eM2ZyBsrCtpmvqgBp/jF1gtCY1D+jzhWbByLM4AdcaEeHsBiLjR3p/evLy
 6RQJUw4D9iMS8oLIYyT/eyN5MiTN7tF0tXvqPiFJg01xLggsNpmqTcS6OvVGMeLvmL4Aqgob2
 DgaNtdUCi4XppuBBgRZuzTxaO24kkr/cKusR6J5JtwKEEG572Ah0akzpIWkFID91WBHbS/+kn
 jLkgRVAVsWJ/1jHMdyTFIaHJD1MKSFvdpU5U3foIhZv6o5W60NhOPJPz2k5fESfOxF45uvuru
 p6TLhbNNZVRN9WiqUxj/81MIRa7W3brMtm9+m+5ISdK0jXW/4eKRJwtbNDvjYmA/zVQ7gFQeD
 K8EH0YUo4DzRfd/Rht3gvIkxocXTjOvGh2fG7vnx525Cq5KZGwBjCdnM1iLGdWFVNXty1TYA+
 GVbxXlOQgW/hzA8TdZyXNmCGP5s5L/ACDXg7zs+75GsBm326bTXhg+xrEhQAz+tJolrS0Ulwd
 45y0vmknwT+8q31cUQpbjUq0pRRnldR3PHEwODg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_214440_873276_15201480 
X-CRM114-Status: UNSURE (   6.31  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Reply-To: frank-w@public-files.de
Cc: netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 =?ISO-8859-1?Q?Ren=E9_van_Dorst?= <opensource@vdorst.com>,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



Am 9. Juli 2020 22:31:34 MESZ schrieb Russell King - ARM Linux admin <linux@armlinux.org.uk>:
>Are there any plans to solve these warnings for Marvell 88e6xxx DSA
>ports?

Maybe it's a better idea to restore previous condition?

if (ret && ret != -EOPNOTSUPP)

Or use another loglevel (dev_dbg)
regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
