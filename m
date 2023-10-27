Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02466C25B48
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Oct 2023 21:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xl4zXkHeuFWcpQhNv8s/3dbQRenrc7EurtmB89vaheY=; b=pCnRGULdpyH1oHrs1+p10OlqCZ
	1Aoc3ES6J4jzHCFKm5IWpKsLZMnDEDhdwiM4h2TN87FQwWp7SLOueWRH/+Ao1ER5S+9sKuOaYg6uL
	S4eFwW4eyw8vhioeiaPfoREP9pOuHTnKksaJ/8zGsCtvNUjzYFR7th8IZLXGUBDOUU1CcK6iBG5BU
	qCKmeG/Ze9bYmgt38Yt9jHV4azaeI8ufESHc9CpKYfC5dychs1XsphV2SyDdvndYys4wIIdUMoD5F
	Sf5pH3kZ190P7uN+SZAau+NWf9SWG3cfYJOIqzrywzbiuNYWeeYLiKE6nYDd6giaOT+pAQB/Z3PAl
	dR2ss/xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwUIG-00HEOq-2h;
	Fri, 27 Oct 2023 21:23:00 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwUID-00HEMj-2I
	for linux-mediatek@lists.infradead.org;
	Fri, 27 Oct 2023 21:22:59 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-6cd0963c61cso1639766a34.0
        for <linux-mediatek@lists.infradead.org>; Fri, 27 Oct 2023 14:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1698441771; x=1699046571; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xl4zXkHeuFWcpQhNv8s/3dbQRenrc7EurtmB89vaheY=;
        b=J3FAtvWzFEFyT+86Rkmp67b8KtwE2iFPwTMor2SP+R+amQR++hqnaMlBNsbRQs3CxH
         gCjpoGOb7Eb/SoWDYlj/nLHdJChw9eb1AkXW87v5Ai2XNzaaJOFB3at1wvnirTfBd0Vf
         x8iaAyeE3iJmxjlNZutyLju/pJWgcI+BGNXUE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698441771; x=1699046571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xl4zXkHeuFWcpQhNv8s/3dbQRenrc7EurtmB89vaheY=;
        b=fJupQZOmOznNZVWSJxyUgj3Xc/omOFjgIMBeLiuEtiQhHduIY4/DOgYJrlgzkpErTc
         89fwhX1GHsVGwFp8fNb4y8YvznulqY89dLGS8M03dWhIBNGKmpzRf2F/p8ADwHzhaMgF
         V8HsienpOliEeDjSMSDljmifpNpACODPamWQ0mlYGiO/f15/ValnDrpcYt0doURCTgDS
         /QAFsEpCL36bM7nbW1Awn0gIaNdNRo3JRpnNhwI4+md5I6ON+DKOwUNt/ejgzHdETvEf
         ojLjvQokuKxVeZ7/5k4QZ3amu5p8gLzF6xplZCZ7mc+NA3E1vs/Dka8za58aDkWSmXVL
         f7Yg==
X-Gm-Message-State: AOJu0YzUuq8UBpmueP0pgVZLsP3NdGaGkLZRyiCsa+ripBI3u1B1tXN9
	s1gqB0hU+qf/zd5UsgVvxZi36rb/opa/gkOjkDELRA==
X-Google-Smtp-Source: AGHT+IGtyxsQVIElVPhn4PwChycLoUO0IBnOpJTJJlENkGw49YyMfxoENC/+K3LcbH4aiI2vBYPF62ksN+R8KRRbXAw=
X-Received: by 2002:a9d:7499:0:b0:6bc:8afe:8a15 with SMTP id
 t25-20020a9d7499000000b006bc8afe8a15mr4025416otk.38.1698441770745; Fri, 27
 Oct 2023 14:22:50 -0700 (PDT)
MIME-Version: 1.0
References: <20231026191343.3345279-1-hsinyi@chromium.org> <7b737537-38f2-4404-b469-c67005cdaf83@linaro.org>
In-Reply-To: <7b737537-38f2-4404-b469-c67005cdaf83@linaro.org>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Fri, 27 Oct 2023 14:22:25 -0700
Message-ID: <CAJMQK-jQUHz8-hEx4DzNU3cOnN59JG1xFBPH5mUndLV-rbk+Jg@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] Add a few mt8183 follower boards.
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	=?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>, 
	Macpaul Lin <macpaul.lin@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_142257_767626_81F2A3DC 
X-CRM114-Status: GOOD (  10.44  )
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

On Fri, Oct 27, 2023 at 4:17=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 26/10/2023 21:09, Hsin-Yi Wang wrote:
> > Add makomo, pico, and katsu which are mt8183 followers.
> >
> > v4: based on https://lore.kernel.org/all/20231025093816.44327-1-angelog=
ioacchino.delregno@collabora.com/
> >
>
> Where is the changelog? It's already v4 and still no changelog...
>

v3:https://patchwork.kernel.org/project/linux-mediatek/cover/20231025215517=
.1388735-1-hsinyi@chromium.org/
v2:https://patchwork.kernel.org/project/linux-mediatek/cover/20231024212618=
.1079676-1-hsinyi@chromium.org/
v1:https://patchwork.kernel.org/project/linux-mediatek/cover/20231024000724=
.57714-1-hsinyi@chromium.org/

changelog with previous version are in each of the patchset. eg:
https://patchwork.kernel.org/project/linux-mediatek/patch/20231025215517.13=
88735-5-hsinyi@chromium.org/

> Best regards,
> Krzysztof
>

