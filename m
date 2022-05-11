Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A478C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 May 2022 16:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tbaPsbFhTBCAjAQ5yC5IbZXVHDxOvt3DtGIOvMfil3s=; b=sRf3O9dFWB6UXU
	Xoh8L+PtsB6PPwwQlqgrrPpxEhIxThrsNk4kOfXA3ktXxweIKl/NYBru9cGvl7rI6FFAIXO03fjYt
	HOV49lq7umgpKfZSb8fSMESDrT8+zxohFl2CM/IEr1sWBK878/aPIiVkLMjxTq0XEevRtUa9PVWkh
	ky+XDl/F2Ymvwn6QBREmbmZ17UZGVhtTm7otMTF1kamRkwMgawPka6m3emo02qzYFnz1ifM7Ab2yo
	GbU6Onf5xSHdNHtlPrZ4heyd7v0M4jZUf41c/yjlErGEdXAvxXGBJmeJs3XWDgGGXb22gXukgoGLR
	zfxyJgCoTFlAHbufIoXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nopDb-007nGM-H9; Wed, 11 May 2022 16:29:43 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nopDY-007nEv-F6
 for linux-mediatek@lists.infradead.org; Wed, 11 May 2022 16:29:42 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 983341F43201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652286577;
 bh=hX0iafREagtxS66FG0SAEAbZpk1B/kOrKATbL3d0zp0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BDPTLaFPsCs9+9U1N3GSw/OfKzPkpcR7P1q5p3URastOjrNfhjHkBpBmxNpMJlMId
 lShS8O6LTW5U6dqmAwNfihHKDDVtoC6Ia9z5UxdHI/SzpuMSYcLdr+mGOGRA4J+Ibz
 HBsk+ok/pVHF36LhohT2MsnLUW1IaY1eKowCgsKAQunrD8QlvNo57EEQ1Hu6oiJXra
 p2qDvzIRAJkz5wEhJmMHl17PbGf18WFwll0n9OPHVhn7n2dvGPf7In8sIdX3RqaKUx
 9ZJCrjSuuzg3TnSSoiNDZ0YbPbvDUIQL7wRq2pgKuoB89AfmiCgrbyiTVfK2SHQ7S7
 TT7l0oX4nMKOw==
Date: Wed, 11 May 2022 12:29:31 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: linux-firmware@kernel.org, linux-mediatek@lists.infradead.org,
 rongchang@google.com, yunfei.dong@mediatek.com, shawnku@google.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 weishunc@google.com, nfraprado@collabora.corp-partner.google.com
Subject: Re: [PULL] mediatek: Update mt8192 firmware
Message-ID: <20220511162931.nlb4gdbnefjgozpu@notapiano>
References: <2537b84fbba82a77ee0a517b12bdcdd5e6ac1503.camel@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2537b84fbba82a77ee0a517b12bdcdd5e6ac1503.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_092940_702250_FB50E3C0 
X-CRM114-Status: GOOD (  14.41  )
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

On Wed, May 11, 2022 at 02:54:42PM +0800, Tinghan Shen wrote:
> Hi linux-firmware maintainers,
> =

> Update the MediaTek mt8192 firmware to v2.0.8537.
> =

> =

> Thanks,
> TingHan
> =

> --
> The following changes since commit b19cbdca78ab2adfd210c91be15a22568e8b8c=
ae:
> =

>   Merge branch '8183-v2.0.2745' of https://github.com/tinghan-shen/linux_=
fw_scp into main (2022-05-
> 09 13:59:43 -0400)
> =

> are available in the Git repository at:
> =

>   https://github.com/tinghan-shen/linux_fw_scp 8192-v2.0.8537
> =

> for you to fetch changes up to 86e64fe7c052b85762eeefc258c379331e6b20b3:
> =

>   mediatek: Update mt8192 SCP firmware (2022-05-11 13:36:48 +0800)

Hi TingHan,

thank you for this update. Unlike the previous mt8192 firmware which had tr=
ouble
booting, this firmware does work and I was able to decode VP8 and VP9 with =
it on
mt8192-asurada-spherion with the mt8192 decoder series [1] applied. So,

Tested-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
N=EDcolas

[1] https://lore.kernel.org/all/20220506092855.22940-1-yunfei.dong@mediatek=
.com/

> =

> ----------------------------------------------------------------
> Tinghan Shen (1):
>       mediatek: Update mt8192 SCP firmware
> =

>  WHENCE                  |   2 +-
>  mediatek/mt8192/scp.img | Bin 309436 -> 327968 bytes
>  2 files changed, 1 insertion(+), 1 deletion(-)
> =

> =


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
