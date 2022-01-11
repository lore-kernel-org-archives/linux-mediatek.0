Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E8CC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jan 2022 19:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QE+Tw/9xMFpXmPlc2csf9hYc368ImwiskvBb+yt6w0w=; b=scTmCfz3nEY9Lp
	MzCmn8ab3XxHd2PC5ubPEDBANExPHKhhrr0QuFUoX5cf+jdnxICJWzf3ITIBvOwRb0W84cUf05mMI
	ZToA5nVuq1XQRN99BqURdX9k7H/gwSACgyIGBBq4DBof3mqizaostVm8WHsUxZY8CoVFYgahu3Zlp
	PJon29Us7l4awzLnEFSUbcK0w5so2lfcVzD9lOWD+/JpOuob3SCd6cuiv9HVK0UnV/diHCiqZFopG
	DQ+fdY71R9OrhxNoP61b/+KJNffg03qWKsnq8gkrYf7MJ7VZgLUuhuCYrleuHOyrAQZF4943IbQ2h
	9kj/j/J0bU7Dld3wSo2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7Mc9-00HP0P-03; Tue, 11 Jan 2022 19:15:25 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7Mbv-00HOxg-Qk; Tue, 11 Jan 2022 19:15:13 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 0A3BC1F447B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641928508;
 bh=GtBWQubh7MRSfsrJwouzQ1KZLx9kkRfXx1s3sYvQ1W8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FqgYA820nG/BheP0MtLycz0Xh86cW9CV7nbyfTgJaj+3HrenpVEcCXZ18TCqs/7qg
 4W04n5wreMasp0sdnxAo6AmMlVk0IwAwR7Mk+IOrNPh35ATUdxiKA1RBDE3bfEsy9+
 keW7SGu4QwoyuOesqaFH2qCvd9kXw6W86G1SEgAHP1urdkjUNsqdHxa8EnSMxPw1VR
 2vHAITsjYtD29gbpqgQM6t8EhqnjuQFDdr9wWStY9uFWjfoN20RdTEeV4tZ37YR2OP
 U3gcgc9tgoOuGp7xhLW/UijDulnXXnPPjsiIRg5JgHJaCREMloJN6lu67xGZIUs/Zs
 KLcpWbJ1xvysQ==
Date: Tue, 11 Jan 2022 14:15:01 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 chun-jie.chen@mediatek.com, devicetree@vger.kernel.org,
 drinkcat@chromium.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com
Subject: Re: [PATCH v2 1/5] arm64: dts: mediatek: Correct uart clock of MT8192
Message-ID: <20220111191501.dspzjabuuohinufz@notapiano>
References: <20220106032420.11544-1-allen-kh.cheng@mediatek.com>
 <20220106032420.11544-2-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220106032420.11544-2-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_111512_239594_FE96DAB0 
X-CRM114-Status: GOOD (  14.54  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Allen,

thank you for improving the commit message! However, please see my comment
below.

On Thu, Jan 06, 2022 at 11:24:16AM +0800, allen-kh.cheng wrote:
> From: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> =

> When the initial devicetree for mt8192 was added in 48489980e27e ("arm64:
> dts: Add Mediatek SoC MT8192 and evaluation board dts and Makefile"), the
> clock driver for mt8192 was not yet upstream, so the clock property nodes
> were set to the clk26m clock as a placeholder.
> =

> Given that the clock driver has since been added through 710573dee31b ("c=
lk:
> mediatek: Add MT8192 basic clocks support"), as well as its dt-bindings
> through f35f1a23e0e1 ("clk: mediatek: Add dt-bindings of MT8192 clocks") =
and
> devicetree nodes through 5d2b897bc6f5 ("arm64: dts: mediatek: Add mt8192
> clock controllers"), fix the uart clock property to point to the actual

This sentence is incomplete. It is missing "clock." at the end. Could you p=
lease
add it?

Same thing for all other patches in this series.

After fixing that typo in the commit message of all patches, please add my
reviewed-by in all patches:

Reviewed-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
N=EDcolas

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
