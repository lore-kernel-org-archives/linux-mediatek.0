Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90671CD4F44
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Sep 2023 09:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XqXG2jgGiK6RcE5JTJCQMqr1wkSsKU5xrFxakZbujqo=; b=4F27h/mUQKV5PyRXqIp6scJ8Ct
	w5HWCUzB2w1hNZ7UvUoT5e6o5yUTfRlaNjVb1vgPGBnUVnmwqDDwH6k0wR8cnLWpEssnrO9Wi+YS8
	bCVl+dg6Gf/cRzZ65gZ3GPau/1Bk5O5gJmk9rdko6eDKe3z/3eem7hs9IDuO+1KYYdZ8ldxb4zudx
	oXwRSGeNtOkXQKdgv+61L2mNfkT/wXAqZzblpHNWO80BLzRt08HcG3Ajz7MOFfQGYoTlbgtqPMBAy
	Ly8nnnUT2G6I9XhNEhNKcvZAdXRtBP27ena289XbrNJbH/rp7FQ3WWnegs1LepkVPa63PH+PaZM0R
	shcRtHbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjciB-008cSO-0C;
	Fri, 22 Sep 2023 09:44:35 +0000
Received: from mgamail.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjchz-008cMb-0T;
	Fri, 22 Sep 2023 09:44:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695375863; x=1726911863;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=XqXG2jgGiK6RcE5JTJCQMqr1wkSsKU5xrFxakZbujqo=;
  b=YGDfioqbnGrb2uIhpWVfh1ohrYWQ3hExTm86rNqUGm/YsdXNqUeg2T9U
   A9BwpQJdfsN+6xnChYsCNC0TvF6hZuMuz+dkZBXuDz6mDs0CboqutR+dW
   gSmtmAsppyE0z8NBKJcNSii84eWKub2Tc18m4cV9UMqhjrHvq85uf2G7j
   x913rTaNYunoeuNEkefqs+zte1/i2nyVm67npOqQxBmzZmPCOxw/SMc4q
   VU7cuNMvZBMbVgNvZpOSeVs8QGCnWs6W1Fzw49s+i9fXPmMkECXNVAWNf
   UbsohN5b5l01As+DpWfzvoTQB20EVw8fCb3mWopLQH1DLinPKVKSv3EZA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="447268806"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="447268806"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 02:44:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="782578828"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="782578828"
Received: from aboreiko-mobl3.ger.corp.intel.com (HELO localhost) ([10.252.50.131])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 02:44:18 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: dri-devel@lists.freedesktop.org, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Guillaume Ranquet <granquet@baylibre.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, Markus
 Schneider-Pargmann <msp@baylibre.com>, Bo-Chen Chen
 <rex-bc.chen@mediatek.com>, linux-mediatek@lists.infradead.org, Dmitry
 Osipenko <dmitry.osipenko@collabora.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] drm/mediatek/dp: fix memory leak on ->get_edid callback
 audio detection
In-Reply-To: <CAGXv+5FvmwMW+bxJ9d_ULbOJA9qpd-vybn0VyE5iyQLHCET1=A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230914131058.2472260-1-jani.nikula@intel.com>
 <20230914155317.2511876-1-jani.nikula@intel.com>
 <CAGXv+5GJxEobJKKWuc_UN+Gf_z8g6eb6KWTz-L+RqtyLYKK3Jg@mail.gmail.com>
 <87cyyetohx.fsf@intel.com>
 <CAGXv+5FvmwMW+bxJ9d_ULbOJA9qpd-vybn0VyE5iyQLHCET1=A@mail.gmail.com>
Date: Fri, 22 Sep 2023 12:44:15 +0300
Message-ID: <87o7huo840.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_024423_252395_F12333BA 
X-CRM114-Status: GOOD (  14.00  )
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

On Tue, 19 Sep 2023, Chen-Yu Tsai <wenst@chromium.org> wrote:
> On Tue, Sep 19, 2023 at 7:02=E2=80=AFPM Jani Nikula <jani.nikula@intel.co=
m> wrote:
>>
>> On Fri, 15 Sep 2023, Chen-Yu Tsai <wenst@chromium.org> wrote:
>> > On Thu, Sep 14, 2023 at 11:53=E2=80=AFPM Jani Nikula <jani.nikula@inte=
l.com> wrote:
>> >>
>> >> The sads returned by drm_edid_to_sad() needs to be freed.
>> >>
>> >> Fixes: e71a8ebbe086 ("drm/mediatek: dp: Audio support for MT8195")
>> >> Cc: Guillaume Ranquet <granquet@baylibre.com>
>> >> Cc: Bo-Chen Chen <rex-bc.chen@mediatek.com>
>> >> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.c=
om>
>> >> Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>> >> Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
>> >> Cc: Philipp Zabel <p.zabel@pengutronix.de>
>> >> Cc: Matthias Brugger <matthias.bgg@gmail.com>
>> >> Cc: dri-devel@lists.freedesktop.org
>> >> Cc: linux-mediatek@lists.infradead.org
>> >> Cc: linux-kernel@vger.kernel.org
>> >> Cc: linux-arm-kernel@lists.infradead.org
>> >> Cc: <stable@vger.kernel.org> # v6.1+
>> >> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> >
>> > Looks correct to me.
>> >
>> > Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
>>
>> Thanks for the reviews Chen-Yu and Guillaume. Will you push this to
>> drm-misc-next or shall I?
>
> Patches for the MediaTek drm driver go through their own separate tree,
> maintained by CK (Chun-Kuang).

Chun-Kuang, can you confirm picking up these two patches, please?

MAINTAINERS does not list a separate git repository for MediaTek drm
drivers, so I don't know where that would be. It should probably be
added to MAINTAINERS.

Thanks,
Jani.

>
> ChenYu

--=20
Jani Nikula, Intel

