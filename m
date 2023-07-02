Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A3CCEB64D9
	for <linux-mediatek@archiver.kernel.org>; Sun,  2 Jul 2023 09:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KtM1yynOXKi5MELLt3Cy1zi+RmzUYWERVvdzTVURPJM=; b=U7gKQOgtzG/VnKyEne8Sin/EK1
	t8oWCDGvNZnz8WRl7WtzSjbo/unvpj9H74DF8bkTHHfk8UoJhRZ7UJPdAkPBQ3iw1QiX+P5jM/HfT
	NWgeQN+mvwXUrA+QyoGlwxVyW9LDPEpNE/qfQK538Vt/YKuH1kGU2QwCx8AWEc/Hn+se0gm4EfLxU
	mbV7gwNQBWMWE/0LAbkgDtxk0U5a8+5CNHXlGMwa5Bdxqq+gLd0V0Joq8tQKopHqk9r0Lq9AzT2OO
	ezcuLdCWf3NPTroNabTfD5OD2yh4vqgfRlkB1q81zprjkB8DQegDnxJ6bkHMZVS6zp9tSEXUe50CD
	82q2bibA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFtSZ-007UYK-1j;
	Sun, 02 Jul 2023 09:33:35 +0000
Received: from mout.web.de ([212.227.15.3])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFtSS-007UX9-1i;
	Sun, 02 Jul 2023 09:33:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1688290394; x=1688895194; i=markus.elfring@web.de;
 bh=KtM1yynOXKi5MELLt3Cy1zi+RmzUYWERVvdzTVURPJM=;
 h=X-UI-Sender-Class:Date:To:Cc:References:Subject:From:In-Reply-To;
 b=BLpSiV+mg6I36X7mSp1Bm09KdUEKjs+9PAH7WOXfOpNHIjDMpk5WQlqEB3I6JohIGTwMRti
 yhqL/KymxMURgT+iS/Sb7O2KsUCUze4/YQG+z9fPqDUTHYtrPRSkMOXR7aPJWK3Xn0Tw09ZWa
 xGLJPxj9VpzlD1/a6sE3pfQp83/iYCOFlMKlxWxNe9JVr/zpu+2dj/rFAsQoKD7jq2Fk1xQiM
 MFgttEdfGaf+FU6KMEJXlvGGDX0348MWkzDyHaBm86wbPvE+d03nQsi8hDRPOlHq5+EgpXDSC
 DdoIfXhZITzG1FWPhqZYj3MrIc+u5HW2wK82dp4MwCZiotEODN8w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.83]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M2ggd-1qJTYU3glT-004Jds; Sun, 02
 Jul 2023 11:33:13 +0200
Message-ID: <1475d01a-2d34-72ef-56f8-87e04be057c8@web.de>
Date: Sun, 2 Jul 2023 11:33:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 linux-staging@lists.linux.dev, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel-janitors@vger.kernel.org,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Ming Qian <ming.qian@nxp.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Tomasz Figa <tfiga@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel@collabora.com
References: <20230622131349.144160-10-benjamin.gaignard@collabora.com>
Subject: Re: [PATCH v3 09/11] media: verisilicon: vp9: Allow to change
 resolution while streaming
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20230622131349.144160-10-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:mzJYK/cOYyX2bS8BVlfXIGvxIEfbahz/ax2yQyUy/F0Yl2qFJme
 8KUy19HBBAN+3VidonlJw71MRrISQAALUetbemKDDl4+nBbMYPVRg/3R68dsMdnE6wYo06f
 Yz1Byoxt2VqZxpfg6kVneklHVZSSG47qZX21uknUOZWEYDgSPpDgP387NcCFyPYosodbZWe
 mCqAYYJupL31czH1IbZLg==
UI-OutboundReport: notjunk:1;M01:P0:TL9t02EPglg=;3/umoIV19ynetyIUxoQZ5sIeVAc
 MpRFtXILC12n/FnO+okIWUVLeYvCpOkqsKcXRz2m7ZEMi1ZsD7NzH3AJtHk42LT2Ktyp9LRM0
 7oBE8NZ4ZCh7Dq+zTw5tfzP1Q6krIKwZJsnPEfglaFFEepZF3VbHsK0S3bl6FEfj1VYgVJpQB
 +tVuyQN2tOM9l/Pig6AnipVy0Pyx6c5oGoTAs7ipJrmZa9qTNVH8vqVmUZejh71yrItYOgBiz
 cHUyQmys27LLQZCWjefbHywlbqfnTOgnCEC9EH+/EEP0+Fw6ju2/9QadioP4m0Rh9CVcvO5kl
 CrI7cxXh3QWw2l2kU3gkbLEy6F0cmxNZ93zcsZHtPIL1KRhytzJVjlfwWO1kjA+AAckH+N8JD
 RyIKLia76111eHiof/TvE/pITUXiMsB5CR7OsJ7ZSVOdGPrtnppK5hw6jVhkpsIQ3hqw9K+/o
 LeiE0ktgdZ9NdQ8T4vvtodyKe9AaOYbX+oRi+8ASFYeKS1zp9+DSpCy0PbTzjS12KTZWSe8B/
 10vtf/mRTJVDnHiEPM1Ud3Dkyf3Q7QLdjeZb0XR8sp6HYdM3OsRE3As5DmWqOkboDaVO5XAIe
 ZzwyymMRqTbhJItOdST2M+pHef/u9jzpdiKDk/z0cwSFWDo3Wom0E/v3n9sixd2hc1ISUTE1C
 OFwkDzYFSYsLKCvY1Z67tE3VxkY43zRNL2HqHIy6Gm8yK95aLqZ36d/RmIWtM+lNQsm9Mz95P
 UMbhMQyAMXFcK8OIlj9h+ymbYHSH2B2CaWvpNoypzJAUOhojX4RM4sIQIFJS2nUD64sS5QPL4
 fQmUYIbWeKDi8VB5NqKTfDBZaB+zNB6X8r03yQv6TJjOyPrE32RXHQOBvx6xz3FdN06q65odB
 GWCc56NPNTDSS3y9hx8FYZ2mtYYs+oy4KctGYXQB7RX9XtmlPPhoF+/ddZklVrN9IF1CFJ1JU
 TqEiPg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230702_023330_916158_844A90D3 
X-CRM114-Status: UNSURE (   5.14  )
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

=E2=80=A6
> This allow to change dynamically the resolution if the pixel format
> remains the same.

Would the wording =E2=80=9CThis adjustment allows =E2=80=A6=E2=80=9D be mo=
re appropriate
for a subsequent change description?

Regards,
Markus

