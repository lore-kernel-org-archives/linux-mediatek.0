Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19171C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 May 2022 02:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wy8qZludZFFcaE4D+mE0mVDwl/GKm67Z2/OvqKwGyRk=; b=TC/xlzqZ4tMuLB
	chC9EWttnDlrkW3YdlCbHWdS/p8hi14w3g4W0xM2twjFhLXKa24l1wbHhr+hky3iT7qKbq7/hlkFS
	JaYXhnm3jnZp/N5BHXTZyjYJwIVo/lMubzKH4ll5lJ5+AzwTuVz3o47yvWp4J5BrVWWGHyZFtes/4
	uXUVcydmfbuok+eaua6xSOpR5W+S2w5/mjayaCeMZX2rGmdXsYnGARNQ4Qst2razK8UoB4otuXZik
	Nd1kz5gY5xzwe/RWJZ8kKF34XCVocefBwqYNqOLSy2FrN+08AvbrljEe4is7CtMBsmi3PTq2MlvVO
	nerx7C7gLZ/qILH/G4SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nnt7g-00C3S0-RV; Mon, 09 May 2022 02:27:44 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnt7W-00C3NC-Dc
 for linux-mediatek@lists.infradead.org; Mon, 09 May 2022 02:27:35 +0000
Received: by mail-pf1-x432.google.com with SMTP id bo5so11054013pfb.4
 for <linux-mediatek@lists.infradead.org>; Sun, 08 May 2022 19:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=U3aNAbM8I+ZWALbCpblJglIHrWEFwVsku0LCm8q0TXw=;
 b=bWQ6elsRmVRougkRhVC48ZxYQz39s7b2EvoauAbMVhIhwRGiKUV9e78zuwsOlNivXM
 UqhfwasYgjW8ucV/oLyEA/o5giweA/xzQWl6YgOdR17YmQdIt8NOaaUhV0B1Fb2gPnnT
 uA7tFVfPKUdekS1Qz0/cDdwR4VE3qURe8IRd9WqlBsluLrOqnVvWP6VLTEco7FaPPLxP
 4txIuIE5BAXgoa18yOQkp77CqEi0/sOn5SzUSL6trzR5kEXtuNy4oZORjwJdzzCRfxB9
 ezCaZWPPi12+AhJxA2aam989TrZhmSwSgV3gMdG+tR9QRe1QUiUFZ5SuCgk9bhtZDH+1
 3N2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=U3aNAbM8I+ZWALbCpblJglIHrWEFwVsku0LCm8q0TXw=;
 b=Enxj544BGZ8HNmcAmD3JM5knsq6NZ3iS7D3bIsWACSj6R63Bazg+oGNXQPzIXQK4+t
 LX4ixvAFHjhP7ZPOajK/ySAtjCcfTFSaWIbOjCnSZhd5sx95pCy00NjaMZouZZGfbpdD
 +wxcMqw85gjvDQoqAob8SyZXRqEv+cOlFo8dl9RK67iIaNU8EMEEzcbKcBObPR6orUZg
 8ZfeKy4CMOrvy8Esvj3haAj8qxKTfCRGzQv3gOyXg9LN5F/Dy241iuQ6FaicdPjjTqu9
 O1OHclnz8dVtHIzuskmNps1oAZXl9CYIvomgQZH4guelFV0zfS/oVARGEFZW+tAUS5dK
 CNRg==
X-Gm-Message-State: AOAM531SkqsOF1k3Yk62h6SNB9B1zJesOzh523UFHUvIbupkiTs9ej44
 3lFk2QTlGebXLnAPyaG9Wmu9CwQamOIuvjbLR0eAyA==
X-Google-Smtp-Source: ABdhPJxIvov+FYbYyJNoqxr/0XSGjEr4PbUkRCXh7qR7Q8mXkveolWuhN5u5sSFYomW0y+WRyG2Emg3YUroTFudGCdE=
X-Received: by 2002:a63:e416:0:b0:3c6:8d10:ea37 with SMTP id
 a22-20020a63e416000000b003c68d10ea37mr5778242pgi.319.1652063249915; Sun, 08
 May 2022 19:27:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220506213226.257859-1-nfraprado@collabora.com>
 <20220506213226.257859-2-nfraprado@collabora.com>
In-Reply-To: <20220506213226.257859-2-nfraprado@collabora.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Mon, 9 May 2022 10:27:18 +0800
Message-ID: <CA+Px+wXQjys8xvTSSJkLXoGp4yQnANbKWBtfuxiYi0UX6DH0jw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: remoteproc: mediatek: Make l1tcm reg
 exclusive to mt819x
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Tinghan Shen <tinghan.shen@mediatek.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-remoteproc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220508_192734_484924_1F3D675D 
X-CRM114-Status: UNSURE (   7.27  )
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

T24gU2F0LCBNYXkgNywgMjAyMiBhdCA1OjMyIEFNIE7DrWNvbGFzIEYuIFIuIEEuIFByYWRvCjxu
ZnJhcHJhZG9AY29sbGFib3JhLmNvbT4gd3JvdGU6Cj4gKyAgLSBpZjoKPiArICAgICAgcHJvcGVy
dGllczoKPiArICAgICAgICBjb21wYXRpYmxlOgo+ICsgICAgICAgICAgZW51bToKPiArICAgICAg
ICAgICAgLSBtZWRpYXRlayxtdDgxOTItc2NwCj4gKyAgICAgICAgICAgIC0gbWVkaWF0ZWssbXQ4
MTk1LXNjcAo+ICsgICAgdGhlbjoKPiArICAgICAgcHJvcGVydGllczoKPiArICAgICAgICByZWc6
Cj4gKyAgICAgICAgICBtaW5JdGVtczogMwo+ICsgICAgICAgICAgbWF4SXRlbXM6IDMKPiArICAg
ICAgICByZWctbmFtZXM6Cj4gKyAgICAgICAgICBpdGVtczoKPiArICAgICAgICAgICAgLSBjb25z
dDogc3JhbQo+ICsgICAgICAgICAgICAtIGNvbnN0OiBjZmcKPiArICAgICAgICAgICAgLSBjb25z
dDogbDF0Y20KCiJsMXRjbSIgc2hvdWxkIGJlIG9wdGlvbmFsLiAgRG9lcyBpdCBtYWtlIG1vcmUg
c2Vuc2UgYnkgdXNpbmcgIm1pbkl0ZW1zOiAyIj8KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1t
ZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
