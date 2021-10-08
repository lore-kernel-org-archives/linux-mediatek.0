Return-Path: <SRS0=sTTz=O4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91D11C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Oct 2021 16:04:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 447D461029
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Oct 2021 16:04:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 447D461029
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a7Jw0s6ePvIsgWv0IwCtuldszO8JU3gx8Nx0Hxo6RRI=; b=2Zws3Ww37d0SMi
	qNyLdO2tNwI8zx3v7gHVSsjbyrx0+2BARJMdS83xiYlRY4MWUhy4NJlNCSvkxS6KJinQ0v6EGVujy
	M8uqB4ggcZb/EPW5xJeKA6tf6aElTr8Ju0weXdIDt4R+W0OUTQ/y4UmzEsfMdgh2i3lzLI8yLD/B2
	bozw96GbaHI3l+kgj9/yWWNObZRpA2de0Nns4PQ1YC0k64PjsBpQ0u0keDjlxfNM8wWSnTtMBagHX
	3vM5kyv/VmN/o4hO1Rydd/2eos1FxPpGr0tJnUzUO21SwQAQmVo+6nIfrqvKuHuMLzpsrZJhO2Zvi
	vdlm+CyFrmio7LJGb/eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYsM2-003Oua-6O; Fri, 08 Oct 2021 16:04:14 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYsIy-003NHn-Pa
 for linux-mediatek@lists.infradead.org; Fri, 08 Oct 2021 16:01:06 +0000
Received: by mail-pl1-x631.google.com with SMTP id g5so3405710plg.1
 for <linux-mediatek@lists.infradead.org>; Fri, 08 Oct 2021 09:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mJr70vtcSbn8HkbIjoqrY+nokUtRVQIO9WTnKtmG5ik=;
 b=qJIOqw5PCw7aJXLpxzhrrCUO7UnCMmPBBpJADmTgebLKqc3R6Yt9mvPXF1qhp+cFxK
 UKFkMylm0fZz+4vhhL46VoJoaHCQf6J86LAi2zcTqDw8018Q3pNJZRy5rGH92gCw74E9
 3oYDDVIwGKvrQjIdEmNpiRH+x9iw3B0d6RHRCGVnwaj7bbYXyb85MrFfOgNUKvPN/5Bh
 EaAR6lHa0EZPg+sw283+W9qmw1ljfzMnFYajJE5gsoPfM+ErTIVcQWYUis6l3dC8VlB1
 6EimFCaCIuEbt1SGFHI6Ou3TSJDaVwItfIwxhYLWlYGq9p6sr9zdT4q6Y5+BQF9Qqfbh
 sgsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mJr70vtcSbn8HkbIjoqrY+nokUtRVQIO9WTnKtmG5ik=;
 b=wYHHGosAJ0eJgBamlBad4koDwvB6g4IxDZGVrC/Vz/sNq0cwLbNkUiQhHP4NjcfSwM
 QDVESumaXoYEc+IsCv+BXq2PaSYgW9T0ciqmXXgMgB+gdOI9a+iIjrCB37G10ZOd8W7X
 D9qfhghoY4XbgP0Ah17KVuFlDSpKLh7stEOYgFyfZ4LaYinXUxjhWvD/kmNhyuDjMK91
 AC+VP9VzF/t9nYX/DVKC8x+A8tO9Li7ebl9nDKKo3O9kCe9eFK6luqx5COysf8bNkBnE
 hZhG67+7h5slt3zz1vSIVUtXQgz9kxWF8VNyDfw2BHFmlyBqLqAXx64ChOuu47eyMtpx
 CqvQ==
X-Gm-Message-State: AOAM531hToziS091mAG3BDx4pJ1pTxmeEzV7b2fhZtBrNabvvo+/sz/M
 sYKJSgu6zG/WKhff0AfVz9gaw/AAiJuZAhi6OBLdOA==
X-Google-Smtp-Source: ABdhPJw2mT/8VUBkZuHdEM/x3If4KXMLcmxLKFmb5zR9aK5AH+CfwKfkE7xSLXja/Ljm5kmIqRq/mfjTrsf50IcgMZ4=
X-Received: by 2002:a17:90b:1644:: with SMTP id
 il4mr9831056pjb.179.1633708861847; 
 Fri, 08 Oct 2021 09:01:01 -0700 (PDT)
MIME-Version: 1.0
References: <20211007094723.202330-1-allen.chen@ite.com.tw>
In-Reply-To: <20211007094723.202330-1-allen.chen@ite.com.tw>
From: Robert Foss <robert.foss@linaro.org>
Date: Fri, 8 Oct 2021 18:00:50 +0200
Message-ID: <CAG3jFyu-nG8jttSfkZ-ZZAg7W9SRFFDWsA9=g7Z1JbNhxBLuyw@mail.gmail.com>
Subject: Re: [PATCH v9] drm/bridge: add it6505 driver
To: allen <allen.chen@ite.com.tw>
Cc: Kenneth Hung <Kenneth.Hung@ite.com.tw>,
 Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>, 
 Hermes Wu <Hermes.Wu@ite.com.tw>, Hsin-Yi Wang <hsinyi@google.com>, 
 Hsin-yi Wang <hsinyi@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 open list <linux-kernel@vger.kernel.org>, 
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_090104_917523_FE4E9EA4 
X-CRM114-Status: UNSURE (   5.39  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGV5IEFsbGVuLAoKSSB3YXMgcnVubmluZyB0aGUgcHJlLW1lcmdlIGNoZWNrcywgYW5kIGhpdCBz
b21lIGJ1aWxkIGlzc3Vlcy4gVGhpcwp3YXMgYnVpbHQgYWdhaW5zdCB0b2RheXMgZHJtLW1pc2Mt
bmV4dCBicmFuY2gsIHdoaWNoIEkgd291bGQgbGlrZSB5b3UKdG8gcmViYXNlIHlvdXIgcGF0Y2gg
YWdhaW5zdC4KCmRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvaXRlLWl0NjUwNS5jOiBJbiBmdW5jdGlv
biDigJhpdDY1MDVfYnJpZGdlX2F0b21pY19lbmFibGXigJk6CmRyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvaXRlLWl0NjUwNS5jOjI5MTk6MTU6IGVycm9yOiBpbXBsaWNpdApkZWNsYXJhdGlvbiBvZiBm
dW5jdGlvbiDigJhkcm1fYnJpZGdlX25ld19jcnRjX3N0YXRl4oCZOyBkaWQgeW91IG1lYW4K4oCY
ZHJtX2F0b21pY19nZXRfbmV3X2NydGNfc3RhdGXigJk/ClstV2Vycm9yPWltcGxpY2l0LWZ1bmN0
aW9uLWRlY2xhcmF0aW9uXQogMjkxOSB8ICBjcnRjX3N0YXRlID0gZHJtX2JyaWRnZV9uZXdfY3J0
Y19zdGF0ZShicmlkZ2UsIG9sZF9zdGF0ZSk7CiAgICAgIHwgICAgICAgICAgICAgICBefn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+CiAgICAgIHwgICAgICAgICAgICAgICBkcm1fYXRvbWljX2dldF9u
ZXdfY3J0Y19zdGF0ZQpkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2l0ZS1pdDY1MDUuYzoyOTE5OjEz
OiB3YXJuaW5nOiBhc3NpZ25tZW50IHRvCuKAmGNvbnN0IHN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAq
4oCZIGZyb20g4oCYaW504oCZIG1ha2VzIHBvaW50ZXIgZnJvbSBpbnRlZ2VyCndpdGhvdXQgYSBj
YXN0IFstV2ludC1jb252ZXJzaW9uXQogMjkxOSB8ICBjcnRjX3N0YXRlID0gZHJtX2JyaWRnZV9u
ZXdfY3J0Y19zdGF0ZShicmlkZ2UsIG9sZF9zdGF0ZSk7CiAgICAgIHwgICAgICAgICAgICAgXgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVk
aWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
