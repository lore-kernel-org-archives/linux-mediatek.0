Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3874EC3DA63
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jul 2024 09:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1HZ/AvePFKQufOPsS1Y7gxr1TS5yWwgKscIUn6jjFyk=; b=dIa7oLGAt8K2VqZhIVbFmP1f7w
	YLX0qtsAeqaw5ymxow5NIq46zLbeL8hB99OwK9JBBn+iD0OBnVfhHKVeni90epnd/trdZ7Mlg2WFp
	xl+s1TIMuygU6wmeVmufvknz1dtokwPwvXzfwMqIis5D/olU0bl2JK3K4JuL4uyBgorBcuFVfMJrW
	7pMEfsjz98nQ50UN9APJtUflS821Q6XdQOi0nME0AztpL3B8CzdiW5+HAvA1FCdEZpC/pdoFVfbcB
	W3j8bTMnB7GwdBBZvSTEwv25kE26sX2Dho/HPQIGUxOVl5aRaJeLThcfYI6Cn1DzJtEH3XPbd+NZg
	3XCxJv6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWXuJ-0000000EqWf-2DVW;
	Wed, 24 Jul 2024 09:03:35 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWXuG-0000000EqVq-1Juf
	for linux-mediatek@lists.infradead.org;
	Wed, 24 Jul 2024 09:03:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721811810;
	bh=OJBjcORicXMgqQr2wkkkceeE9D1kAAb+ffbZMaOnLWM=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=uJT4O6gXnTOqwHmu4Jry9ABRfunIvxna3bbUGScRjEb0t9oi7uhEosy5LAFToXQWY
	 eqaEOHLjn1htc0ruypgaYAxFuK387ae16e9Gi6GNhtemgsZIEXB8aXUgNmfoo9b9mt
	 so/QJTIMbnJjSSjPnOenvMrCQY6LGOrq8Ujdt/cPsYOGmuw1qQLS/wjeniRbhEmfdR
	 xQZC2/g4sg3i/012up1L0FY+sT18Y1a7v9KNv98EJZHiwq9it6ydUO8uyRTR1vjzvE
	 bwK9GAe/Kb/+ahIqygnBAud9PiC6UpHOFdPCQlXiLGQU9KrrNxpEls36nja/8xGjGo
	 ZjK3jLgFZRhGw==
Received: from [100.66.96.193] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 21E533780BC2;
	Wed, 24 Jul 2024 09:03:27 +0000 (UTC)
Message-ID: <61c39125-9906-4b5e-8a83-8e0aa2c3ac0d@collabora.com>
Date: Wed, 24 Jul 2024 14:33:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drm-ci: flaky tests for mediatek driver testing
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
To: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 airlied@gmail.com, daniel@ffwll.ch, Daniel Stone <daniels@collabora.com>,
 Helen Mae Koike Fornazier <helen.koike@collabora.com>,
 Sergi Blanch Torne <sergi.blanch.torne@collabora.com>,
 Guilherme Alcarde Gallo <guilherme.gallo@collabora.com>
References: <0b2a1899-15dd-42fa-8f63-ea0ca28dbb17@collabora.com>
In-Reply-To: <0b2a1899-15dd-42fa-8f63-ea0ca28dbb17@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240724_020332_522526_DC45C6D8 
X-CRM114-Status: UNSURE (   8.17  )
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

Hi Maintainers,

On 28/05/24 10:55, Vignesh Raman wrote:
> Hi Maintainers,
> 
> There are some flaky tests reported for mediatek driver testing in drm-ci.
> 
> # Board Name: mt8173-elm-hana
> # IGT Version: 1.28-g0df7b9b97
> # Linux Version: 6.9.0-rc7
> # Failure Rate: 50
> core_setmaster_vs_auth
> dumb_buffer@create-clear
> fbdev@unaligned-write
> fbdev@write
> kms_cursor_legacy@cursor-vs-flip-atomic-transitions
> kms_prop_blob@invalid-set-prop
> 
> Will add these tests in 
> drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt 
> (https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/Documentation/gpu/automated_testing.rst#n70)
> 
> Please could you have a look at these test results and let us know if 
> you need more information. Thank you.

There are some flaky tests reported for mediatek driver testing for the 
mt8183,

# Board Name: mt8183-kukui-jacuzzi-juniper-sku16
# Failure Rate: 100
# IGT Version: 1.28-gf13702b8e
# Linux Version: 6.10.0-rc5
kms_bw@linear-tiling-1-displays-2560x1440p
kms_cursor_legacy@cursor-vs-flip-atomic-transitions

Will add these tests in
drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt
(https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/Documentation/gpu/automated_testing.rst#n70)

Please could you have a look at these test results and let us know if
you need more information. Thank you.

Regards,
Vignesh

