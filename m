Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF1A10F92E3
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Mar 2026 17:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E0yhE4GnVbJG4hKHIdWBFQgvJX3G1vXsn2yBdUvHrzU=; b=LNKxMTmrAUwvMhdYDKPyMtqLrn
	02JsodmkXb+o9olY9d+TW9+jKSkj2BMr721mfFYuvtb9hzwEuxKCEU5dJ8Nh/TqvzbnPmuJXQ8SRq
	guEp6zySviZ9FL1mpi2v8vZGBra3vtEhusd6GkickztImHpL1aC7ejpAM4mxZXJ8ipMM4ZfFRZTq4
	mJltBIZvkeumNQsaDUTMKHnr6VcAgotySiDP7V+vFoyz9jfwTGqtNENpnD4cf02exO5b3DVGtaT7A
	vPqVDAcGME/bH04nOid25+ME1dwKHMlDFelzTo7/4YxRxneNRaUxizWC4MMD+JJHm/CmUAHDS6wop
	cl72gqlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7cwd-0000000DLf5-0KUu;
	Tue, 31 Mar 2026 17:32:03 +0000
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7cwa-0000000DLds-3DH6
	for linux-mediatek@lists.infradead.org;
	Tue, 31 Mar 2026 17:32:01 +0000
Received: by mail-yx1-xb12c.google.com with SMTP id 956f58d0204a3-6500040ef83so5518213d50.2
        for <linux-mediatek@lists.infradead.org>; Tue, 31 Mar 2026 10:32:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774978319; cv=none;
        d=google.com; s=arc-20240605;
        b=Ezp2MPxLgZsd150qMo70vwRFWXcbrTtDZj8U/yHWVi3ouiPJ9JEqDoR8oCrYMaDChG
         SxqrTukUJ4FZJ2m3+Ifeikw3vM+ODkGS5qEadjAIF85wx/Fh9lLChe8f/RJPt4f8mbkE
         QltfPdm4BwiCY5JpiVFHWe9ncQ6/qYBBln6lNfNfkzwm/zAiIHKB32ys+RN0M/eMH+JT
         HZyLtle1AWZwUE71D1A0Pu0I9YBRd6aSuY6ox3STyPVqLOvm32r6Byl+8RxuQku56pyh
         rhr7PIdur/ynemCaX3QhbIJK8HjDmjYy4NhZc2L5rcCfu+suoRF7Fg1aH6omsRZNfFze
         vJHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E0yhE4GnVbJG4hKHIdWBFQgvJX3G1vXsn2yBdUvHrzU=;
        fh=rvEw3b4ggpAapjSzZ470DlIs9rsTyli5zX7Tfbhz6HA=;
        b=fKaU6Jkx4dgdxX9G2gb+Nxncvuhsi0QJAM5Kvx0zSuijmJise8UaW/+WsMxfxbA6qo
         yPwu+sAxgFvOzNzrmkkoHUOWZYDqP/IVM0YOJRUOi0wOuy5yTdO1wk6sAzqw3Hj6STmy
         DUbd0oWOkxbD+vDGZ/PoRI1Bln5/0jjeW7FkzCVJ/lRMYduYfytSXnu83ktIVvHawk/4
         HDScWG7e9Qi9I0hpo6VSrPrLRulHoInkWzwh3AZA2vwM/EZJtZt9efyBonjBBkL2ZjsQ
         KdqPmKv4cHKbTiGZHZQHZVcN9EH8WbkptnwOW1EoHGIb5yxQFRL4G6JvojEWzjiFtebJ
         682w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774978319; x=1775583119; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E0yhE4GnVbJG4hKHIdWBFQgvJX3G1vXsn2yBdUvHrzU=;
        b=RViFhMP7nNqoYaObc+XricEFXts52XmHEOlpSG1L83M3B1tRynZKUAg4PLkZSUt/sN
         QDG9PxWyj/zrjyy/lijvbkhp4F4z8me4Ah091mtSkU+ajxqQmnxCN4qDr/uJyuUKqEfZ
         ZBZwRbBXXpTrU6uqpt6komAAzxa0wAbEXqyntKcxVDwBXxJdzBgUd+eFQSbvDzKXzK44
         psT1wQuFwc/KVhYfUTGBsUnu5jJoEZRvxqTnv+9bAwSY+SgK31Ry8O8ideSq7Mw1Wh6f
         QGotWqaiY5Yk7zLz9K+aFbMCw8moL9HtJ7Yffysowj1kkM6gEt2lW2bva8TmkZXy5OQh
         0rPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774978319; x=1775583119;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E0yhE4GnVbJG4hKHIdWBFQgvJX3G1vXsn2yBdUvHrzU=;
        b=Dx8V1UADM/mAjzTiLv+o/ktvNcdlw4eQur3Eqiz2qdpGzMPHU3bOoZdmYIS7hkP3pF
         27+vhLH+XCaEAmY1bEX/tyLhgKJnwFG9+HM3RltkI8iN92g9Yh3P+2gPYUn8f3DkcAHh
         FHQE1tGSrMH/1FZ0CdfE95gfJqsqREE7iTi//EJScj6cRKZHVJJeH9iIR8v92XA3LKsj
         9uryeAzSlcJB6lzHMMmhHSPcN1H4x3KNMjdHNExMBageS3C6JbDgc2CM6vP/ziwSMpQw
         OiZrGtnwzG5etCySxgrlVIMaLFUheh6/vhJehl3fQTZ5o70M76UawxR6Db4RL6aDf6MX
         ooAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmw6OTLAZfiDKeziet5gK7VD+eT3/xolVpAXD2aEyifBoDbvKVjvD6VgHNBT/EHGJ8r7AlM64vtwRx0qcSNw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxCJzGXOvrgX1NeAdCeCiLL6fAYa1ThI1niHJWkP/qLIpUufifQ
	I2ud+sGizx7fpcwv2/JYufdNYibYJSaRBkjtvkeBUE/VvMeZap6UrhRkvF0Gz81PGAIFjT8MVbT
	Edjy0q8NNCpQukZoT/vMDayWvJnhU0/8=
X-Gm-Gg: ATEYQzx5sieU2Ec8oScgCaXHrzAggh7BzhieyXxyTUIELxL1VV09cy+WkHTq8T+J5Cy
	B1ThrttdGeeCuwSkXa8IGCr8bYpsBZTMB/ClXNnfuGCQceEgdTBXDSw+8Rw7lN+sslqTZwLBi1z
	wnWRGwd0n18V2QBh+TftuXD89i2zxfqMcpKnybSQu7OftGMaYVke48FNISNJB+UzbsZCLyDmIwW
	+5g/G7++bEOnDnw3DMXYwoadNEoLwCaD+j7HTLLGoPnY59ZwY24AmhS1A9cE78br/q9IPbvSBEo
	QVBjhOK7LJ/Qo7KX9jnHBiQZokJz1LSflBb+0mJv/4pE98OWm7M/y+GN4zMiTNCN55N/tg==
X-Received: by 2002:a53:d103:0:b0:649:97d9:cf1f with SMTP id
 956f58d0204a3-6502fe40abcmr71151d50.44.1774978316344; Tue, 31 Mar 2026
 10:31:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260331171043.F1C481EA006B@mailuser.phl.internal>
In-Reply-To: <20260331171043.F1C481EA006B@mailuser.phl.internal>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Tue, 31 Mar 2026 13:31:45 -0400
X-Gm-Features: AQROBzDtH2rQqqFQDzX0DAENqJJXYBOysXiWpgWuMs-qnB_6ztR_ntWKoAltnrI
Message-ID: <CABBYNZ+mr1_rf0shA8xiWweq2tydLhFXBrhjpry-tnY2u4X8qw@mail.gmail.com>
Subject: Re: [PATCH v4 0/8] Bluetooth: Add MediaTek MT7927 (MT6639) support
To: Javier Tia <floss@jetm.me>
Cc: Marcel Holtmann <marcel@holtmann.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Ryan Gilbert <xelnaga@gmail.com>, 
	Jose Tiburcio Ribeiro Netto <jnetto@mineiro.io>, Llewellyn Curran <melinko2003@gmail.com>, 
	Chapuis Dario <chapuisdario4@gmail.com>, Evgeny Kapusta <3193631@gmail.com>, 
	Nitin Gurram <nitin.reddy88@gmail.com>, Thibaut FRANCOIS <tibo@humeurlibre.fr>, 
	Ivan Lubnin <lubnin.ivan@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_103200_801934_8BA15C19 
X-CRM114-Status: GOOD (  15.94  )
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

Hi Javier,

On Tue, Mar 31, 2026 at 1:10=E2=80=AFPM Javier Tia <floss@jetm.me> wrote:
>
> Hi Luiz,
>
> On Tue, 31 Mar 2026 Luiz Augusto von Dentz wrote:
> > Ok, but on 8/8 it seem to suggest the problem still exists which
> > trigger the following review:
> >
> > https://sashiko.dev/#/patchset/20260330-mt7927-bt-support-v4-0-cecc025e=
7062%40jetm.me
> >
> > Perhaps we should ajust the commit description if the 19 seconds
> > doesn't really occurs when 2/8 is applied.
>
> Good catch. The ~19 second delay is indeed fixed by patch 2/8, so the
> note in 8/8 was misleading as written.
>
> I've updated the commit message in 8/8 to clarify:
>
>   Note: boards with this USB ID expose only one ISO alternate setting
>   (alt 0). Without the fix in patch 2/8 ("btmtk: fix ISO interface
>   setup for single alt setting"), this caused ~19 second initialization
>   delays. With the fix applied, initialization completes in ~2.6
>   seconds.
>
> This is addressed in v5:
> https://lore.kernel.org/linux-bluetooth/20260331-mt7927-bt-support-v5-0-6=
f31b4342daa@jetm.me/

I've already pushed v4 with the 19 seconds comments removed.

> Best,
> Javier



--=20
Luiz Augusto von Dentz

