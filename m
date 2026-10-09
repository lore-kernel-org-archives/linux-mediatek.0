Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA7DCA6012
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Oct 2026 07:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZWFUNR7NkCd2nR7CmmLol21VHCNc/dGraaedEy4x8BE=; b=2ZcoOiHXKowOO2dN1HJH/VRt5C
	VB1ZC9vcArIA1YDD7WNePjYmszqxzrfieZVE7cxMfj5C9f7tdEniQLoxvmsGSZfW0eYZ4O2RRJnXo
	5TH9987WsZy+Uoc4MqBD9Y/C06sEa5/xFmDD/aDgbKsQBagtoCe1pHG5eIRyW21TyXaBth4F9Z22q
	w9eN1DjF+tDyfr41Gvx5PbcGodF+zNZBDwyo+N77cTbMpsO4n0rGQx87k9kmk8Fl4UiWNJKjBLaO/
	exW2IqfrZx9O+oXrGyGO7P7YuE+vEmycrEZ3lwVMVaYjv4TUSF5xbWHBO+ehHMkntsji/Lsa4VFYT
	fmwWh0Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF4v6-00000005iCg-1c9r;
	Fri, 09 Oct 2026 07:21:32 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF4v4-00000005iC0-0RHA
	for linux-mediatek@lists.infradead.org;
	Fri, 09 Oct 2026 07:21:31 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-6a9e5ba741aso5705743a12.3
        for <linux-mediatek@lists.infradead.org>; Fri, 09 Oct 2026 00:21:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791530488; cv=none;
        d=google.com; s=arc-20260327;
        b=ptQBieY38xYZwT9EV44Ys5QNHW16cVI7RTH5G/tjk26uAQlrJp4wShUd3Mkq2OA86R
         npdIeN5IuzCXUXTOnLzS+qBmDMSTdHwwv5NpVbJ0vRHePrFBxzqWkb6qO/i285XFS4cX
         nURwqEmhtyvyH+SaV5A9duKqY4g19Xc6BnChYH41v2KDpeToOcLGyF/D5p4rXHzwRNQD
         oHvCk/p6aN8qbRJDtMDHafULlPoyJ8o7ZPrf6WJzZyWAyUo6XthdBW/hKIqSnJWD2o1y
         jRdxmSsknYchRMJO2T/MhqN81OyKr+F/raMWiAUk/sK/YLWxlkt0Ms6m2sCOpftk0pYY
         DEPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZWFUNR7NkCd2nR7CmmLol21VHCNc/dGraaedEy4x8BE=;
        fh=Bqy/CuCBTHiR2mR1l/Rk1O3W2x2uPn3rwJlvKuZzWSc=;
        b=Bf/0b/AmLyHSHC/Nkx7QNDyFeUPsh4kQYi9632K0BXeuuhzo/iwcF9Oe0hjAObIGOO
         4YKIllGUx1Mk70nDDboYizcPfwEbG4vfGvzxw/X+iyJuiXL6XaIdHWito1vzjewN5rCl
         SYQRGPpocwpIT0SNzqsoeMqMbbs/dMA4ItD+gY9QueUtB7Kx2M6P6fbdetR6nly/eH5g
         DeHjHWD1KJowa07uq8BYxGzcsExDkrIob7tQr5MOCC0MwWAb8xphbLbVdmd2eiu/trr7
         3gb5noXvcMkO6I3pOOieKzsIzgxI7jsd4NbZKFY7vMmU489rNzzqqYZPQqr1roJq7+37
         mFyQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791530488; x=1792135288; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZWFUNR7NkCd2nR7CmmLol21VHCNc/dGraaedEy4x8BE=;
        b=Wz2YaPZWP1Fsrx6/nIaSQRB+6UI2mdn8SNqXRFZ1DMxMSddHROFcbN1THBV50YVqXk
         gqfATVQ8Pjc0wYcigg1KQOza0PHM+/3ZQgR+2XaHwU8oI61T+PsCvySOAQuvbCHSEJVg
         vG1FtaEL7CNQ1gyLuifcFWqRgCnUohFWddSf9uNpepBZYEtd9C0sgUs3RjdFhXlMBhf2
         OudZUp/XjcJQeqwidaIVt88VKUgLZwCLBqlQ+n8Ca7bTf5nUElcABKzB/HMooI3dL6PD
         CDWVypHP6YSkjErPskmItkcmLanPTPdDT8+jEAbREfT8OYEMnL2jJCtmXPR1CN/+f47K
         zN2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791530488; x=1792135288;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZWFUNR7NkCd2nR7CmmLol21VHCNc/dGraaedEy4x8BE=;
        b=nDM08EUebZUrvI2guK/o2RfQOpSJu4CPhT8OnRKQJlM2gnEM7wlRZ4BMtOAjVnev4I
         1SpGsz/SEUrKIjpNKMrS0cSHQsGPk/zGLY4g2EtWByMeUU7DTsPig4hKGzJNzJJ5Lpim
         y9bdFyl8Di9ayuJh1JRu7nFV0En6yWr7IABIyO/XSkYI9sBem4ZwzPln59nf93/GnvxC
         EdvaWq6uu9O5ulWS5KIyTCL3B3CYgRkvW2cchL0ovE9ziAUedIRsZdOxxlte54reRB4J
         4HDf2PEh4Erir5rYBTx1Kc/UTwI224QknK5iyFaTPiDh7PKefewQ4Z/IyA5zZ9AL/nhX
         1ZLQ==
X-Forwarded-Encrypted: i=1; AKwUvBwkoU/xcFYVAf2hXFSFArgW8RbnM/WhC56Q0AfY8ZAypfU9+dOqprksOqz6uBzgiWX8maBbwy1ZPfjc98yHhw==@lists.infradead.org
X-Gm-Message-State: AFq9FYKU3uJKBq9YaJSba6gnROECcVIw6Ij+SXDNXhvvJWMqfVAsIQ8n
	WG4Wq9YXObe/QGSd7Qo3/vUEUNlr1tZPHjmRt15qq7VwN+vsoKdfQrNoVRva/K1zbm9K0cA/Y5e
	Q8FxXhBfOPK6xULjCOAmHyERB0Clqa7A=
X-Gm-Gg: AYBFou0lzIPNwS2nT7sAef6mQ9WGVpJSG+aFbSb/OeDOMZN94dpaQ2HPe/FjnJHwEjv
	vwbLoyPWwlUadx7tCbB3cZgKEMAvX7R6lpq08um5iEcoK0KONnZIROT0bfFIyrz/R9hJpCF6Mt/
	g5AzDOcKPmDQCRjoeJEeNQ3dX/ky79OLXvzKWG2KemvFR5K+EHQXkt3KGNZqjuCQHSqGdamhVfP
	8Wb0lxy5jaak4aoeTHLs9LovTfZ3kBEhwkLbtrL5FMI9A5vaPG/NPnhqPcbbuw0z6CTJ/oqYfCx
	cKawWNcRLI+M9BR16g0sm1F39uX4/QVMaTRPtAdsyanvUO2V2C+scPo0aFuqIY8/Gm7TMg8cWyA
	J9gO95+DbkRv/gQ+47LBwqvCt6VrsjHA0kjErheBLMGMXEV1/0QYILmxaaVnU8/R82T8=
X-Received: by 2002:a05:6402:2489:b0:6a9:aabb:5364 with SMTP id
 4fb4d7f45d1cf-6b17c2406a9mr722739a12.11.1791530487888; Fri, 09 Oct 2026
 00:21:27 -0700 (PDT)
MIME-Version: 1.0
References: <20261005110257.50145-1-phucduc.bui@gmail.com> <20261005110257.50145-15-phucduc.bui@gmail.com>
 <24ffbf82-adad-4153-a2b9-f2123189c722@oss.qualcomm.com>
In-Reply-To: <24ffbf82-adad-4153-a2b9-f2123189c722@oss.qualcomm.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 9 Oct 2026 14:21:13 +0700
X-Gm-Features: AclHuK9p57z2uGUnULQbpxyjyLXl9q0M8bfa39_8UwomVGEzhtoBlELb83gkc1g
Message-ID: <CAABR9nETXgKCex=sDx6Y=eJOTg42oj0egGv6268T14v510Zf5Q@mail.gmail.com>
Subject: Re: [PATCH v2 14/14] ASoC: mediatek: mt8195: Fix clock parent error handling
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Trevor Wu <trevor.wu@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, cassiogabrielcontato@gmail.com, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Haotian Zhang <vulab@iscas.ac.cn>, HariKrishna Sagala <hariconscious@gmail.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_002130_162297_A1AB5D3B 
X-CRM114-Status: UNSURE (   9.25  )
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

> Was the intent only to get the DAPM error log
> here, or should the commit message/code be adjusted so the behavior
> matches the "properly handled by the caller" wording?
>

The intent was only to get the error reported instead of silently
ignored; the commit message wording was imprecise. I'll reword it
in the next version.

Best regards,
Phuc

