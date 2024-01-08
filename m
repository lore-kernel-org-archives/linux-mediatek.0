Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC0FCC3DA6E
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jan 2024 15:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0dSkJ2ZiJqHanlAP+HAK0y6zusm5LzCHKOPBAF01RGI=; b=4G0j9CalE96FryRInGTbPQdLxa
	zzXN1CXrRRYw6IuYWs+Lv6sDPY8pX+gQI5+0xeB3bBWiFB7HInlt9q/GyozW6o4mmem510+bz1JEh
	F6VZhqQvoYeyLj/Qo0u6TtVIUdwFwz1H4H9Z5fvbNHsm01yHgDTxoyOO/mXlDPsLEDYpiT6kLqt2b
	p0hOZ25NTiOrZ8/icil0RfwFL7IiY8PfMrgmujSBawUf2ESDnnijyGMcPJV+Xu3fllg2Kwpk1XO0N
	WeV4IS/JweQ9ONNfTB4St2UDkQH+rrETCL0DaVF3MNb0SWAWQfAyLUTNfH+JZc7hF7wl5w9IFxkBt
	0jCgmtFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMreg-005V6i-2f;
	Mon, 08 Jan 2024 15:35:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMref-005V5V-1B;
	Mon, 08 Jan 2024 15:35:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=0dSkJ2ZiJqHanlAP+HAK0y6zusm5LzCHKOPBAF01RGI=; b=dJgt4wTk0nuO8qbaXkpHe2QGRq
	craSt56fF9Z9Soullk/jqkVP82WCJWpBrr3syfdPTg9HnubP3BPBWxN/B0FxjoEbqbqrgId3ktrmE
	CCOyPwkiuGaMlJaja1Z2Em1FESWwd17FNr5gar21toiSEpqMZ6OILISxCG0qZ61bHfn9hbRkJ+w6o
	wDdSk0WYA0ZtvUjptggLfmjUUg4cHbMRD+QiMydKf5d9DSBmnH+cxIt+o8+MeE7LFKOn9FDf9wR8Z
	+VgLeD6luJ/LCqBNUQRTqPDf9bvaHcssml827KoJ75eQ3nAOpOBVOLzFNKIteK7VpKGQrctbF8Ben
	fSsG/FPw==;
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMrea-007s2p-0y;
	Mon, 08 Jan 2024 15:35:07 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-33677fb38a3so2160267f8f.0;
        Mon, 08 Jan 2024 07:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704728101; x=1705332901; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0dSkJ2ZiJqHanlAP+HAK0y6zusm5LzCHKOPBAF01RGI=;
        b=hIGZH1NFfvfMK1yo3ypPkDKdov5b0zpgfV2FKFEUSM3dIwnAWj6uHGmglqcBjm3tUw
         +h6Eac08CgooMzQ8LnBYOt5ZDX1hNnglRFtH/x7KOa/uf/oJNq6e2EweReFDCC7i3VZG
         PZy5PuH5tDiNX0ZBfAhqVUknH6vI0EyahoQBkYNEX1CrgQip91cXynFYpY2HAVqSLITB
         e2Oal36W49H/z8sB1I7jxvy8XZgw7hMLi7Vhy7p20WP3lvs6r/mXI94ZiNpLdOyd8cma
         sQBvWDBFcsDsN/82jMiJLiuhRzjRxL14X5NXkRsEiW62n7QFUVQG1kox7KC/dAC2F6v0
         KzVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704728101; x=1705332901;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0dSkJ2ZiJqHanlAP+HAK0y6zusm5LzCHKOPBAF01RGI=;
        b=QXHWE3ZWsFhqpeU+SLlyGOTE3EqFq0fBeKWE/95UMgmNZGD7XiA8Zduq/VGqj3oy7L
         2XnC6hdxHoIvOgUwSBGR6K4mO9JjZUjm1W/V+WpYIo1MZ6EKam4ORbCoraFYaeh8552p
         wAZ0qeWrXLOMLoFydNdZY+WGr8kmxZqjUS4MvxjeR33w9y2juJx1IspIosddqen4ksDV
         Aas93gl1GnCgE1DeJQduQULcBWWtvlKmonSjN6v7HcfE+C8PTPBRyTWkBnLUezxWtONw
         /c+aWoEd2VRcxGvbog+WQhBkMOo1YXFb9tDI+QBhwUgzItpsqfT7jeenS8cXMq1SleDz
         mAzg==
X-Gm-Message-State: AOJu0Yw9p6rjMCAr2gqomEhMTFrD0ivIPQab78NkYGln9bfngxKp2jui
	lwFX6Ezs6proacQmRL+buEK/HW7iRHlin7fKt0c=
X-Google-Smtp-Source: AGHT+IEDyiUE/fCZgQ2fiflpohBhP714EYsyUDi/vkkXfWWGgss80RDHy8tK389zVkT20aui+pSoTQyf4TXc3l08ehI=
X-Received: by 2002:adf:f0d2:0:b0:337:4c69:d6b with SMTP id
 x18-20020adff0d2000000b003374c690d6bmr1755895wro.6.1704728101148; Mon, 08 Jan
 2024 07:35:01 -0800 (PST)
MIME-Version: 1.0
References: <1700864395-1479-4-git-send-email-quic_mojha@quicinc.com>
 <20231225135542.1789-1-ruipengqi7@gmail.com> <520e377d-e990-c185-4a20-07806873e506@quicinc.com>
In-Reply-To: <520e377d-e990-c185-4a20-07806873e506@quicinc.com>
From: Ruipeng Qi <ruipengqi7@gmail.com>
Date: Mon, 8 Jan 2024 23:34:50 +0800
Message-ID: <CADHLONEn4oyRFrNWEbt2mxMczyc8FrDLMzaZ7fsijzm9Y8VTBA@mail.gmail.com>
Subject: Re: RESEND: Re: [Patch v6 03/12] docs: qcom: Add qualcomm minidump guide
To: Mukesh Ojha <quic_mojha@quicinc.com>
Cc: agross@kernel.org, alim.akhtar@samsung.com, andersson@kernel.org, 
	bmasney@redhat.com, conor+dt@kernel.org, corbet@lwn.net, gpiccoli@igalia.com, 
	keescook@chromium.org, kernel@quicinc.com, kgene@kernel.org, 
	konrad.dybcio@linaro.org, krzysztof.kozlowski+dt@linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-remoteproc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	mathieu.poirier@linaro.org, matthias.bgg@gmail.com, nm@ti.com, 
	robh+dt@kernel.org, tony.luck@intel.com, vigneshr@ti.com, 
	qiruipeng@lixiang.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240108_153504_598550_A39E4A8D 
X-CRM114-Status: GOOD (  16.36  )
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

On Wed, Jan 3, 2024 at 11:27=E2=80=AFPM Mukesh Ojha <quic_mojha@quicinc.com=
> wrote:
>
>
> One more thing, kernel part of minidump, we are calling it APSS Minidump
> has limitation of no of entries so it will be difficult to dump
> non-continuous regions after a certain number of registration ~200. Howev=
er,
> we do have a solution in downstream kernel for it like to create a big
> CMA buffer and register this buffer with Minidump so that whatever gets
> dumped in that buffer gets captured during crash and fill up this buffer
> and create elf during panic. I think, similar thing you are also doing
> with your OS-minidump.
>
> I have just glanced into your implementation of OS-minidump, it
> more of relying on basic concept of RAM content preserved
> across boot and later reading it through procfs but this basic
> stuff is common to pstore(ram) as well and pstore has file system
> support why don't you make your driver as one of pstore record and that
> way Qualcomm minidump also gets benefited where entire OS-minidump
> record gets registered with Qualcomm minidump and we get this on panic
> and you get this via pstorefs.
>
Thanks Mukesh=EF=BC=81It is a good suggestion to move OS-minidump forward!
By the way, I have some questions here for which I need your assistance.

Firstly,I can reimplement OS-minidump as one of the pstore records to
dump data. The resulting dump file would contain thousands of
non-contiguous memory regions, each with only the virtual address and
size recorded. As far as I know, Qualcomm's minidump can handle
several memory regions, each with a physical address and size.
This seems to be a difference, and I'm curious as to how you deal with
data dumped by OS-minidump. I would really appreciate it if you could
provide more details on your approach.

Secondly, what tools do you use to analyze the dump data, and does it
support crash tool?

Lastly, is Qualcomm minidump compatible with non-Qualcomm SoCs,
and if so, how can one use it?

Best Regards
Ruipeng Qi

