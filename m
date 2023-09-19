Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 443E0CD54B3
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 11:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uELnytT+CuvLOJY3ZLfkVdcq80klKvGzS1iwGb1zs7A=; b=YzNxD4PNIz4LRQ47Py70Iv/+4O
	LuSSlvxzik+8e3ni09foSwKscQ/Hf2o13ccXbjRO3q8bEEsifqq06+9g+vLc6KkqGIFs+12PVFiRd
	kJXbKsFn5lqqKgpvSAGmuyCIizeetN21DHzUXl5t7DLpjJgm1UlENPX4hoUtG/Z/Vqj0lKsolxos1
	fVGlj+wkkfnhCFOKL1HgPCjLZ2sK6hzYqYyZnJq+K3GEQ6C4EDXA1enbRtV2NpBjaFhtpp7rKcwaI
	M3/m842YFcqPzs8u1KNc4QlR6eMW7zNfwOuSkmOBMZD63Qp81JKOj8L0IMmuFDZzKrc4K9bohq5ZM
	WfId4wcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiYV1-000Dip-0n;
	Tue, 19 Sep 2023 11:02:35 +0000
Received: from mgamail.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiYUy-000DiU-32;
	Tue, 19 Sep 2023 11:02:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695121352; x=1726657352;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=uELnytT+CuvLOJY3ZLfkVdcq80klKvGzS1iwGb1zs7A=;
  b=i6P4oO+rfr4V3iRxa0OAAHKAiTmYDi/hRpijKgl9rmnyPZr14pJ0ybeK
   6jF+a/wswwiJT+h9wUCWB8msagty08WAdua2WwMX0Rio+YI+F90c8SDjw
   4UTchxUFLCs+vdWB9JFsDGL2GNzB3uVLHMS7dpPhHEL1EFuNbmwwvlxy5
   jUr2SfVhUT9et06QQT6rH08sxIIxkaee2XYxay0MJ8SREooMnAgWqGRT7
   jtk0Fslez2EcBAn/iSPNyKHCGW34N8UIU+EJG3KeUQ9OSIUQ8gCZQir6I
   0CTGvaAWG2QCywM0HqbKRhsYfLKfjWsdFVKdR9MHX2IZ8uc8+H36w4aLK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="370229179"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="370229179"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 04:02:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="919830091"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="919830091"
Received: from tjquresh-mobl.ger.corp.intel.com (HELO localhost) ([10.252.37.227])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 04:02:20 -0700
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
In-Reply-To: <CAGXv+5GJxEobJKKWuc_UN+Gf_z8g6eb6KWTz-L+RqtyLYKK3Jg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230914131058.2472260-1-jani.nikula@intel.com>
 <20230914155317.2511876-1-jani.nikula@intel.com>
 <CAGXv+5GJxEobJKKWuc_UN+Gf_z8g6eb6KWTz-L+RqtyLYKK3Jg@mail.gmail.com>
Date: Tue, 19 Sep 2023 14:02:18 +0300
Message-ID: <87cyyetohx.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_040233_094225_95CF776B 
X-CRM114-Status: UNSURE (   9.80  )
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

On Fri, 15 Sep 2023, Chen-Yu Tsai <wenst@chromium.org> wrote:
> On Thu, Sep 14, 2023 at 11:53=E2=80=AFPM Jani Nikula <jani.nikula@intel.c=
om> wrote:
>>
>> The sads returned by drm_edid_to_sad() needs to be freed.
>>
>> Fixes: e71a8ebbe086 ("drm/mediatek: dp: Audio support for MT8195")
>> Cc: Guillaume Ranquet <granquet@baylibre.com>
>> Cc: Bo-Chen Chen <rex-bc.chen@mediatek.com>
>> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>> Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
>> Cc: Philipp Zabel <p.zabel@pengutronix.de>
>> Cc: Matthias Brugger <matthias.bgg@gmail.com>
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: linux-mediatek@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: <stable@vger.kernel.org> # v6.1+
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Looks correct to me.
>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Thanks for the reviews Chen-Yu and Guillaume. Will you push this to
drm-misc-next or shall I?

BR,
Jani.


--=20
Jani Nikula, Intel

