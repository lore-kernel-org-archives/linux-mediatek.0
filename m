Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF72FED3FA
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Apr 2026 19:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GCNnQDUxEchu4FNyI6KaJj/nrZ702FB7670JqnkUaFA=; b=b2BXRBDbs2BFA9geHkmhJXXrxL
	Ez4KrIWjGoa6t1y9ufKCtCU43K+TYsxAVBBXXN8FIdv1c99Fjue7nmgAlowu67toOis4OSc8366by
	YHyAqe+JD4jkm97F6+sIHHXqtMzaY6S14pIW9RRUVM1uFhUPGBjW6KTeRmcm5YJDpizVCEc3/vkvy
	ApLPgDl5K6h63sk5OZcryb8zfkEu2t16uqtLkDJlU/p5TWwY0irmeChxWlwzn5sWh1GQhh/MV9iG2
	IrQD+hK62srna5R6G3Y/H2lUqrqTon3DnGbBdn42SRP4WHAIPtFkAOO8gBNtAh6RbvGn+f4BJkh1T
	+6H4dqVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGMMb-0000000Di1Y-2sJx;
	Fri, 24 Apr 2026 19:38:57 +0000
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGMMY-0000000Di1C-3aLu
	for linux-mediatek@lists.infradead.org;
	Fri, 24 Apr 2026 19:38:55 +0000
Received: by mail-yx1-xb135.google.com with SMTP id 956f58d0204a3-652f220595fso8622034d50.0
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Apr 2026 12:38:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777059533; cv=none;
        d=google.com; s=arc-20240605;
        b=S+Bsj/QzNY9Xefhb8Y+Ka93U0K0sf+eUgcRNFQBYRICgW23Ag4+RsO168KrpDGad+9
         fhxMM7H/DS2HxCGiHdyhj/ytOlVjf28jsNodndcyAg14nvkAejE9pTtjCzhX10BlyYPq
         FxuTBCH+k4zay4kklf+p8YVdgyNYwOGS2285fFxogZ4nwCuK6PY51Fp2sBCApjXrKfhK
         wAC4wBSBFyKtSJ9H/sBkyOZ2vlNg5vqUj2rUtCjEzg4wBPo/PYsmwft4IKcdwpKEwK3D
         abC/s4c6y5Y2sqgmjmhrqNlah6er5IXT7pQR6dzU28Yc42V2Rhy1wGiwkQ8pvstoP/KZ
         c1uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GCNnQDUxEchu4FNyI6KaJj/nrZ702FB7670JqnkUaFA=;
        fh=K8R+Eh3mQMzGoGBqjyWLz1a42r1crPSP1dCzKx7y+WI=;
        b=hbdpfa4QgNePCCk09snc+nbkRAuJmPfp1oqz0qBtVennRdx74etJcfmKX0vCGt41lE
         p3+jwvFN0GKnSUtB/SqSqVUkF5rhDQAlwb130l9N5dT/nN7ZTrPzbzyi/m17L565S78d
         tN4hA9L1oQl/Kn7JntgFD1Pbvxb+lzBnPS1xvjyHLHuCkiriV75Qc/VY5zLSRMOHpd7F
         K2OPSJIste2jAGBaLrTuJC58J0Col7roHRY/TmaQWJtHqzy1h0gf1Ob74u8FDK1gOgvJ
         aS2MiRjh/ZAqtaouXh331RAhNvf2rnU5PLlXz3m3heCtg/CU3Q1hJhjc3ruJ01hAtWDW
         EviA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777059533; x=1777664333; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GCNnQDUxEchu4FNyI6KaJj/nrZ702FB7670JqnkUaFA=;
        b=H0RkMmVasK2ItzraKKOuRhFLs68/fFNwgKT8Md4wup9e+Xn8D5MH+nrxSecl05m8XI
         oy/bnpAidT/MuLh/4pM6qnYD4HZoCmjJvam2EEpMgesI9siWxyIH+t5bymcK8jKwHSJM
         uXp9sY8T0KjwNmfIoZk8Yah0Kt9TeiQZ416l+IVo1MwhSdPbAuT9eBSodYoJa60NZ/hK
         20N3xZBzQDoJYemYOo+hrDY9mUNYUsRwmZqJrglO+F2udFowv3+njBBXECK4CgHlOkyi
         f9otm69CXJlTnwbHqeBHqHDFgr16i1zzuaoTCm9TzMZntEf6XNc0WuWHTTdUWfE2/C4G
         UVlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777059533; x=1777664333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GCNnQDUxEchu4FNyI6KaJj/nrZ702FB7670JqnkUaFA=;
        b=edWz+gWVewZlXn2oK+9jtHbLhrDmf3DF9izBSl38sz1j2t8Zj4XJnV3qAGi9oZoGUl
         PnlNVTvruAWiyVpa35tcgaUjptvJmN4lxtuN5kqqYkuVu/CmdKOpYchI/n0l3u3WEr5c
         Khx/ON9n8lsC/43r7yTqZo+cMbXZAOY+dj+4Xt/2Cfh4SYiKJlzPzSM1lL+YdxHfN20D
         /QKanuGtxONNsJL2gXBgX7OZC56f57QJ38wmK0u8u5B0Kx8/TJNCp4qz+jqXXl8Mrtyk
         HTqOIpACObO258X3YI2Ux7bv0RlKfBdw9IRDsySWgud2IflFn3aoH9141QLEKlkV7fmP
         pesQ==
X-Forwarded-Encrypted: i=1; AFNElJ+zNklMF683BDrBp6Gbz88zo2bfhEuAhEgKrUeH9JjtmWIZY4AvHmJBSlU3j/IHGEPs52ANNNcYIeX0OR5ngw==@lists.infradead.org
X-Gm-Message-State: AOJu0YznXjNzcCAzp5rUhr/KZAJl+G67M3fEkfSazR0oaOftZg3x/AFB
	B9fJ8rBTAaudLwlHEL6TCDA7FrXtj/oyYV82K03OX2+uo1AD7uM+G0AKw0uxTOQH9IbjvpoxiCh
	dRuahWVCb9TpEC74rX2J3LyUWJwydDuE=
X-Gm-Gg: AeBDievJ2hhd+mSbvlSS+oIVR+XfZlvFRhWFZ84Nk3jnDHIrLK5GTen9p2zr1ZTwo86
	0em2xhnSp5CwXBAuhYDZLcYHx8mAzRbw8p/uVOlqyZcfb/oUUpkUHkaNeusoZANVfUPUAnKdKYs
	LctfGdAmaH4rg4UJZD7LJ33HEbUXpzTpR0WgGb/2+iHg6EHBwf7Pe9l1yNjVTRNsx/yy4NgzfUJ
	veyHfi0FOtG+5ezwgKyZrXu04eNuvCeVk0crUkBlLTlLxqSmBl6gNMNC5cCo/Z3aVslx0vcMrPo
	Rn7tcroqQgSWQk3YRfj0YKIDjwyqS1SCmQl62rJIJ170Fm60MCvE/q2oJcFIV8uq1h4WYdQyUeh
	rzA8yjwhnD14w4hY=
X-Received: by 2002:a05:690e:d56:b0:64c:af3f:e2a3 with SMTP id
 956f58d0204a3-65310a7e203mr25561744d50.55.1777059533014; Fri, 24 Apr 2026
 12:38:53 -0700 (PDT)
MIME-Version: 1.0
References: <770d36b07311bf88210c187923f243fb9f126f04.1777058551.git.pav@iki.fi>
In-Reply-To: <770d36b07311bf88210c187923f243fb9f126f04.1777058551.git.pav@iki.fi>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Fri, 24 Apr 2026 15:38:41 -0400
X-Gm-Features: AQROBzDhDYXNch-tOMSEEQLPsmr7KizOzoNUP3VoVe7ksdz9u-pNewyslVDZrso
Message-ID: <CABBYNZ+jM+2BQ4Fek87OCKbyvuxjsyeCG0qpGRkAO4LA=pj4xw@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: btmtk: accept too short WMT FUNC_CTRL events
To: Pauli Virtanen <pav@iki.fi>
Cc: linux-bluetooth@vger.kernel.org, marcel@holtmann.org, 
	tristan@talencesecurity.com, linux-mediatek@lists.infradead.org, 
	sean.wang@mediatek.com, mark-yw.chen@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_123854_903625_00EB45B8 
X-CRM114-Status: GOOD (  20.90  )
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

Hi Pauli, Tristan,

On Fri, Apr 24, 2026 at 3:25=E2=80=AFPM Pauli Virtanen <pav@iki.fi> wrote:
>
> MT7925 (USB ID 0e8d:e025) on fw version 20260106153314 sends WMT
> FUNC_CTRL events that are missing the status field.
>
> Prior to commit 006b9943b982 ("Bluetooth: btmtk: validate WMT event SKB
> length before struct access") the status was read from out-of-bounds of
> SKB data, which usually would result to success with
> BTMTK_WMT_ON_UNDONE, although I don't know the intent here.  The bounds
> check added in that commit returns with error instead, producing
> "Bluetooth: hci0: Failed to send wmt func ctrl (-22)" and makes the
> device unusable.
>
> Fix the regression by interpreting too short packet as status
> BTMTK_WMT_ON_UNDONE, which makes the device work normally again.
>
> Fixes: 006b9943b982 ("Bluetooth: btmtk: validate WMT event SKB length bef=
ore struct access")
> Signed-off-by: Pauli Virtanen <pav@iki.fi>
> ---
>
> Notes:
>     AFAICS the commit is not yet pulled and is only in bluetooth-next, so
>     maybe this should be just fixup?

Yeah, I'll most likely fix it in place and add your Signed-off-by.

>  drivers/bluetooth/btmtk.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
> index ab34f1dd42bc..68a32d11e5ec 100644
> --- a/drivers/bluetooth/btmtk.c
> +++ b/drivers/bluetooth/btmtk.c
> @@ -719,8 +719,8 @@ static int btmtk_usb_hci_wmt_sync(struct hci_dev *hde=
v,
>         case BTMTK_WMT_FUNC_CTRL:
>                 if (!skb_pull_data(data->evt_skb,
>                                    sizeof(wmt_evt_funcc->status))) {
> -                       err =3D -EINVAL;
> -                       goto err_free_skb;
> +                       status =3D BTMTK_WMT_ON_UNDONE;
> +                       break;

This probably means the original change was never tested on real
hardware. We likely need input from the MediaTek team on how to handle
these events, as I don't think a public spec exists.

>                 }
>
>                 wmt_evt_funcc =3D (struct btmtk_hci_wmt_evt_funcc *)wmt_e=
vt;
> --
> 2.53.0
>


--=20
Luiz Augusto von Dentz

