Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D9B2C001DC
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jul 2023 09:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3uc0Curgmt+VrULCExmwJ/YPmVc0tCAHeLhIS1yceX0=; b=P04UyGqhI4jei++L5lNxr+L79E
	K7f494XxTtXaNXaHg4YQjovixZ0/4WNMTbV/iFLN1gUHsavYR1wyYPZWVeamuWmS7IB/0ngdr28js
	fFKt3coTIUiCvV+TlSeOkbqtgDk8vojZmZsrooOMqfOKDHAhzeUjRvLcJloeafd7lZLBUwcwVBikK
	Tpa+bUXa9PshcplCTcooH1afsW5QvZ0nE2JWZsGvPLMK2QYaJY9csulUJclS76xDV+kT/fsLzDNyN
	m8CozDA+0cYgT6A+pImazKq3PXc2bxGScNcjf5VFmAXZKAaiEc+4XJdnsVn+fKiq6+eD72YCcO1BP
	6yj4fTOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOxRZ-00Cr2n-06;
	Thu, 27 Jul 2023 09:38:01 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOxRV-00Cr2H-0V
	for linux-mediatek@lists.infradead.org;
	Thu, 27 Jul 2023 09:37:59 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 780966607038;
	Thu, 27 Jul 2023 10:37:55 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1690450675;
	bh=10mp7xD7Cx1D3lv25ctWipvmwRGE+3207Gw4RhcXQzE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KwGRUSuQxGQlU2yv2sqfBKZFWPTU+O353Ms2oGNUkS8cEF1e/XcogqaxvB+CPv6Bg
	 9sloWG7DSzjnPtGH/caSjE2Y0FDfon4bWCPfO13tsjIhP17E5ovAaqteAT/b21M+ed
	 rrqxyz98Nv0wWy+bYP3bTWCt7DMv+Q7GCktVS94oNUpr9EkyYHPcWjZ/4qbvxZksJ6
	 8zHrkXeNBQBezE0zFHBsX3EwkPlle+au0npQXE9xR03e+tCDkq6vzehpkgKsV+dfSn
	 PwUsTBOHC2ZKNE+caml+2kAoBd1jJZ8qJ841uKpTfjeWKtNci2MLgXPFAVqx7o49AE
	 KFdUGc9ip4qHg==
Message-ID: <9334a56f-77d1-f062-08d9-33a6c6136fdc@collabora.com>
Date: Thu, 27 Jul 2023 11:37:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RESEND] drm/mediatek: Add valid modifier check
Content-Language: en-US
To: Justin Green <greenjustin@chromium.org>,
 Daniel Stone <daniel@fooishbar.org>
Cc: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 chunkuang.hu@kernel.org, jason-jh.lin@mediatek.com, justin.yeh@mediatek.com,
 wenst@chromium.org
References: <20230724175839.675911-1-greenjustin@chromium.org>
 <CAPj87rNJa3CNWekovSMjgfGyduJ5BZtcqAumKfDdooW7Ocs9zQ@mail.gmail.com>
 <CAHC42Re3LoQQOzPww7SbYTEK2MLHwtkitvEtV6uBnkQNST30tQ@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAHC42Re3LoQQOzPww7SbYTEK2MLHwtkitvEtV6uBnkQNST30tQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_023757_342751_70FD946C 
X-CRM114-Status: GOOD (  15.32  )
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

Il 26/07/23 21:44, Justin Green ha scritto:
>> Would it make more sense to commmonize function mtk_plane_format_mod_supported()
>> and call that one here instead?
> I had considered that, but mtk_plane_format_mod_supported() is
> required to take a drm_plane as a parameter in order to conform to the
> type signature defined in drm_plane_funcs, but
> mtk_drm_mode_fb_create() does not have a drm_plane to provide, since
> the framebuffer is created later in the function. Technically we don't
> actually use the drm_plane in the implementation of
> mtk_plane_format_mod_supported() today, so we could just use a null
> pointer, but I figured we may one day need to add per-plane logic.
> 

My suggestion was not to use that function as-is, but rather to add a helper like

bool mtk_format_modifier_supported(u32 format, u32 modifier) { ... }

...so that a per-plane logic in mtk_drm_plane can be easily added, because...

static bool mtk_plane_format_mod_supported(struct drm_plane *plane,
					   u32 format, u32 modifier)
{
	return mtk_format_modifier_supported(format, modifier);
}

so apart from that, is there any other reason to not do that? :-)

Regards,
Angelo

>> This is not DRM_FORMAT_MOD_INVALID. Please either explicitly compare against INVALID if that's what you meant, or against LINEAR if that's what you meant, or both.
> Ack, I meant to use LINEAR. Will update for the next version of the patch.



