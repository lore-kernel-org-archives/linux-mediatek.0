Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DF22C531D0
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2026 16:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d45tURx3XWs+kAyjHrk/klKfMYkvuvpPKIkNMmnC9Pk=; b=y+ZnLriR8j97fTg9OhNYOjeQlO
	B65IcsZski1ynibhoqWcqDraKEe2Zev78DySVLecEK+JR8WfxpZ2HgCAmzL25ncDFHIvbQaQB0u6M
	MU5wocfX4ANCRZOvfhJI9i0o22+vIZXntqRAMG3N7kOLPY1qRVbxCZ+sOQ3Jjnyng+zcQmVwkRmi3
	Fusddrz8hGI4sk9i/66KFUY2NKK+NyDOko5ooRynlOexQu1zihPakEQW6gft650gtb6EflB9Aqlt4
	Cq0DgKNw8jNsvK9IortTzllfyfvMrsnVxWCusBk6YtYurR6BDQBv44KrAyZBtcKI8ntaFN2h9WgU2
	l8lJ2grw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOVD-00000003RDG-1cUX;
	Mon, 27 Jul 2026 16:48:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOVA-00000003RC1-2mkP
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Jul 2026 16:48:29 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlbDi855781
	for <linux-mediatek@lists.infradead.org>; Mon, 27 Jul 2026 16:48:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d45tURx3XWs+kAyjHrk/klKfMYkvuvpPKIkNMmnC9Pk=; b=QwXc30K8UvMnTrI+
	wYvzNBzzz6mmhTFlIJVxbpP1n+zDceDpbcl8AU/4CxteUn+Qj2krzqq6ts++mRT2
	JzAt22YA10tB+FQbNEU0OW00pc2GOFJmjNik52NhF0fmP5o5FxhtQkmhFhJYjbKm
	yAgqJeXmA0JFjRbEcHmzqkftWSlZoR7LFP0eaExFvA4PPkWXKCj67Yw7d21YnTGs
	G/YN7dYPUr4iIdzKIHifrdqrDn5X0Muy+A479uT1stnrMcvTyny//I+LfsLB659H
	cPWefnrowLmiISioa1brd9OtuH+FcEIUoSWdhGmM2Urg7u0wVUO95j6rYhkQKib4
	KwyuwQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fny9wk5yd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Mon, 27 Jul 2026 16:48:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51a8db414c7so43825451cf.0
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Jul 2026 09:48:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785170907; cv=none;
        d=google.com; s=arc-20260327;
        b=iyXBHwh19v7qNiNOMLU4hZoNSk9IqHRD+KJHTYeWQa62cjmGZYKEpK0SR0iTaAOF/l
         X3udmw9Kc6pBdkmV71bKdFxsiSXk5e2pwQI/2HpuZ3EVlg6v9R4CGJSqQBj+hcewvMih
         A/hDLfYadaKbD/Wpdb9lOf6hYYp9WWjZ1MXuF/K0T5IjuL2YOqnOwAxVauaH9aA4x4dI
         KxGVyUOXPkRE2OSalPYT6PrBrGQW16JZFP9j+pftH6xqkXjCXUcEIaL4Jec12sjJN4Ar
         ovP8Eum3m/en/5k+6YX7lk7DSiO0Mfk5PHAo4qOSBzGxPByqrwK6gpb0U6ewYuIgCmec
         lWtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d45tURx3XWs+kAyjHrk/klKfMYkvuvpPKIkNMmnC9Pk=;
        fh=lXykE5NZh8+SsFJ/q3eMX66psgP7cCHSiLKguBuofUk=;
        b=dctOZmYppxpGTzMZ6jtfxQpabEiAUjQMo5jArIlh5QPE7/VxcS3GYI0Kcg+K5rded4
         N57/VY6CnhJvMlTSlaPlebXWdeCwYvgqyWMvgH2h6HblO+KsxmUdyqldA6lUjHWZw9Pt
         NEGF/XF5mdmX8nJ9dM4GrgF5MUGiC39PAUIZrXewIFENgoxWcqW1GCvJ18wjbNw+NwmR
         3Wgl/2ZFdNGcDu7X+XaJKUddiW7N7FdNKCibGJTWHoWwcrX32v/5a1KQnS58vCAJHeY+
         2TfSWZN8xA7UQqQQLEM2QyUkI3wi1YyrQslGkbv35XKk1rweXikcsdkq93hu+Moxt0Nt
         rN1g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785170907; x=1785775707; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d45tURx3XWs+kAyjHrk/klKfMYkvuvpPKIkNMmnC9Pk=;
        b=cZ7HodI1mPwJ3UYFEXnK7HiRFW3AOY9yErq2bCSCMwrjDWTOfOUCbWAF9EXvosbHOf
         6LUNIwRQkz1A/psSvJx/is/Bgsmy8Vb16BTcFLwniynTENom+Bi2y7MR4OlhYYxPrima
         3sEcqQp00tyS6O2hF2bAfyyGxVwcEbO6EtfvZ2wfZdOt1GYbxrpMH0FRrKDqtL0ycJkH
         5MfhoO14Xfwy031WO64FHWj9cH2KJdon+gIUOlihIyylDuwHwUS1Ir+oUst3Wcq02Br/
         rzGqFgFDR2eZDGgTMjgIID7B+rCaCKry2f663NBIAIJEndqT+Qe6IBa1FgPGBd7ZnqEh
         2WFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785170907; x=1785775707;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d45tURx3XWs+kAyjHrk/klKfMYkvuvpPKIkNMmnC9Pk=;
        b=Y0jzGvzG0FBggMYYYlh/f8VpSK6kAtQz692JvMBO9h41QRwl6CsiAFbfBigWyc3Gvk
         yfqfRcoGqQOeu1nb9CejqxGzfdKC6/7/4z22uMAXlXk3BViCoQbydvOATVEu9SfBJSkj
         Y97h92xUlpQuoiAgvZpvb+JeBSA4vPZ69eK8l2GGy7/fAay2uXyb/4NlWoQMpVt9mw88
         0GKRscfwmMYhX1gHPh0FW9HJH1/DNw3Cjh2YwUgPZAykDgw43CwVFYIZuDAk6fa6mGDx
         S790o4yeP/qk+/cnJ+ffbnEQRpO3Ijy9a70E99i8FlVs5LjifUuyI4IL1VuPuTWVDTPa
         hBTA==
X-Forwarded-Encrypted: i=1; AHgh+Rp31XEqL+uaT6d/wlnFCrWPSt/ouRFTopJugjIB0Z/ZxRMhIR1iY1gGryF12lhuoQ0oRu6Aetb5SMtJa/sBLw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyiNOfotFzs/4ZsF8VFuu+CbWdNoC+CouMXXq+aiaCz6Sf4lyOK
	ojyXXGyHMV87K0U69DY9aquB+x3cKy21Lqa0Pu8+wiOkHaaWlSg6A6PUVqSRxnoVH7Mkjqws+TP
	TIF67qcognPXyLsOPEQU7pDl9jVmcmyPB12NvMcajLN6JAS+qpcQ9UwkdsLbsjfp+zNm7xuICs0
	85CjelLL/GC4f8bbuXISRf3nevUX5TGIHZ9hQy2il0scYsu6MxKA==
X-Gm-Gg: AR+sD11AlwlchlPIEW9w5JWvr/kFD+08b0tb2MeHF1SPhpGARz1mTFQR6NrAKgVe8Jd
	YADsDWjL1bHWn0ON3XKdEx4s4MitKluTvaqbBwrKt4r1xiUHxEXiK5Q4SOLv7+P4w1YNGQ2jmej
	Dbvehc2Xxel1swtKgM2ake2z0QTSqz5P7bM+zoFVffbi3AUHd/+u5Vb1naxw==
X-Received: by 2002:a05:622a:8b:b0:51a:8835:58cb with SMTP id d75a77b69052e-529a86b1bf3mr107887101cf.54.1785170907041;
        Mon, 27 Jul 2026 09:48:27 -0700 (PDT)
X-Received: by 2002:a05:622a:8b:b0:51a:8835:58cb with SMTP id
 d75a77b69052e-529a86b1bf3mr107886821cf.54.1785170906641; Mon, 27 Jul 2026
 09:48:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260722132729.302067-1-dmitry.osipenko@collabora.com>
 <CAPx+jO-1_ZpYcnPtoYxRn5vv34tiP7TXnjKZ3SaWkEzdeTfXpA@mail.gmail.com> <3130633c-fbff-4b1a-a127-bd4eb678c3f6@collabora.com>
In-Reply-To: <3130633c-fbff-4b1a-a127-bd4eb678c3f6@collabora.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 18:48:14 +0200
X-Gm-Features: AUfX_mwYyJK7opquw-Zgrx7ikepnD3P77x7E8vkOGtJWpCSQCzJtEQPkLeMKHN0
Message-ID: <CAPx+jO9-b_XyhS_CtX1ZFiH96WMYjjcvOEcO6u6CLEZq61rpaw@mail.gmail.com>
Subject: Re: [PATCH v1] pmdomain: mediatek: Fix MT8183 hang on boot
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Ulf Hansson <ulfh@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE1NSBTYWx0ZWRfX5Bbl/tGyR6r1
 DnIymr61mOa3JPHXlJrjKwQvsoZaZUE3ajqgMmwH4wxt8vQLot7bUI8QxsFxfPJGXbEWd9RZi/i
 nmk1lnwumTYoWRlbEGclk7kOJODGlYj/QaC09wxjw1lPY2V/K1r8xx6nnrgQTt0Q6fB1PeUQkXi
 3S+9GKhEo+OvohIVjOvXQrRCWVLC5sybECuItcWtnrQs9/laIPmd26CW0x/jUCVymTa+eGHHyZB
 3cmsssX3tgNAYJ5hJZIVEBvBiUjFYIy/M/RQhNlsSTxin1W7kYjQMEiw8qxXkUzO7l01HxNhePO
 6l8w5/Y73R6lIw3Ssdf3QbQfDJvtH+4ZJnUfFjKaQl5UsRC4qkEzl16qdVypm5P3xMx+eC2d3mb
 +SRE4LnT2F6LkKL9IlEvGwyXU2GftmjE4dzW1n52pIy6Azit6D5ZQQsLWRG5GHzSCB0Ld+z8c4h
 mROaRhtpKfevscnFsXg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE1NSBTYWx0ZWRfX/MB7IiLZnEQE
 2dj99eIMkx6EH4zZWDhq576vUWmdlxjRIIb56eKKms6BL6e8aShIk1uyei8L8E875ffI7v2MANJ
 SGl0incm+JVTbXMlRX9CoQGJluqoVAY=
X-Proofpoint-ORIG-GUID: lr-wp0RZOULngGlE3rC554t16zlPzVf6
X-Authority-Analysis: v=2.4 cv=E4b9Y6dl c=1 sm=1 tr=0 ts=6a678bdc cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=QX4gbG5DAAAA:8 a=gHq1O5mURKo0xi8WsWsA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: lr-wp0RZOULngGlE3rC554t16zlPzVf6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_094828_707582_0F845813 
X-CRM114-Status: GOOD (  36.05  )
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

On Mon, Jul 27, 2026 at 1:04=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> On 7/24/26 17:01, Ulf Hansson wrote:
> > On Wed, Jul 22, 2026 at 3:28=E2=80=AFPM Dmitry Osipenko
> > <dmitry.osipenko@collabora.com> wrote:
> >>
> >> Depending on firmware, part of the MFG domains may be left ON at boot
> >> leaving only some MFG cores powered, to let the ACP to prefetch the GP=
U
> >> region when the display controller is brought up. This doesn't play we=
ll
> >> with an eventual delay in probing Panfrost when the display controller=
 is
> >> fully set up, as that would make genpd's sync_state() to power off the
> >> domain while ACP tries to prefetch: this is causing an AXI stall,
> >> effectively freezing the AP indefinitely. In order to prevent this fro=
m
> >
> > I haven't made any detailed investigation, but to me, it sounds like
> > there is a missing consumer somewhere.
> >
> > Should the ACP/panfrost devices be a consumer of the MFG domains as
> > well? Or perhaps, if the ACP/panfrost should rely on the display
> > controller to be probed and powered-on, to be able to probe?
> >
>
> This is about how the bootloader is leaving the display controller, the A=
CP,
> and the MFG registers before booting the kernel.

Right.

>
> The kernel drivers themselves will reset this weird state when the HW get=
s
> to full probe so there won't be any more issue(s) from that point onwards=
.
>
> Actually, there would be A LOT to say about this, but I'll be very brief.=
..
>
> Basically, before booting the kernel, the bootloader is leaving a half-as=
sed
> setup to potentially support continuous splash functionality, but without=
 it
> being actually used on the device(s) that we're talking about here...

So does that mean that the print in scpsys_add_one_domain() ("A
default off power domain has been ON") gets printed for these PM
domains?

If so, perhaps it would be better to turn off the PM domains (if
possible) before registering them with genpd?

>
> Again, I should put a remark on every word of that last paragraph, but th=
is
> is the gist of it.
>
> If you're curious or need more information, of course I can expand a bit,
> there's no secret involved here, it's just that I'm avoiding to write a w=
all
> of text around that...
>
> P.S.: We've been discussing that internally and chasing this issue for mo=
nths
> before deciding to "solve" it like this.

Huh, I see, thanks for sharing.

I think it would be nice to clarify a little bit more in the commit
message, as it all kind of indicates to me that there is a missing
consumer or that a parent needs to be runtime resumed before a child
is probed.

Or another way of looking at it, that perhaps makes better sense.
Based on your latest information, it seems like the PM domain isn't
really fully powered-on by the bootloader, but still we are telling
genpd that it is, leading to an inconsistent state and errors.

[...]

Kind regards
Uffe

