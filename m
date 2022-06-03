Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F8F1C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jun 2022 06:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mrckBVdd7lBA+LkJ5itq86RqMX+TqdL8GoIaN2vAvLU=; b=LX/F+YrXRpQbOz
	TwYnUjPdESCetvQXqPqk91asaznlQAZZTP9y4LWbDVz+NK64okvc5kDf+BXxrUy47anZyw2HIJT/h
	pIVMaEvhus6F5dv0yitY+dvWhD7vJqokPuQj5iXiHbP3ja2dUKn0EmsCcTg2UfXL95wH1/i/ZDxlr
	UfQMyJPwCJpOHdiKtRZ5Zu6xjWb2OwN2iJQe5aCIIubsaDVmP44tI7akJ+2aYPW/yAsSsoKTfKN89
	pSiN9uDqHGZBDgY7UVf9PlZsA93bIXCBeFGAWZ44uBSFK/iIwzktCUmuyqry+7igAMCmxOCvwlli7
	4nR9Qyk/wor+P3fqk4Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx1BK-0067XS-GA; Fri, 03 Jun 2022 06:53:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx1BH-0067Us-MJ
	for linux-mediatek@lists.infradead.org; Fri, 03 Jun 2022 06:53:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654239188;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PN2E70IcGQYkGbR9w9o/Wmx5ihNGlhc87gRXnC3Yt38=;
	b=UYsddOsdGcbBRx3DhOpXahilwmijCMWwr+hmuYN5weUelEjcN68VQInUW4QN8TJOTNK3hr
	XIlmZ2tJ3pfIv8nzdClsSeJoeLdTL+nQffntNFqIGxV/nhoA2hNBB/pAN3hDeVYyxz3ZWk
	qAiqp2JXa+TnN2PxC1rTjmikSC0WMkY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-616-kfvCM2GaOeWJUm18OJkKsA-1; Fri, 03 Jun 2022 02:53:03 -0400
X-MC-Unique: kfvCM2GaOeWJUm18OJkKsA-1
Received: by mail-wm1-f69.google.com with SMTP id ay1-20020a05600c1e0100b0039c3a3fc6a4so1022012wmb.4
        for <linux-mediatek@lists.infradead.org>; Thu, 02 Jun 2022 23:53:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=PN2E70IcGQYkGbR9w9o/Wmx5ihNGlhc87gRXnC3Yt38=;
        b=hsAJd8QkFIXDMOq8juoR3twRigZ9uMtV4KhvWIcaNi1hj1PhXpdYGDg9SWGMQKT6kj
         6/mrDT4CeyMWW0q4Sv60U+8J64W7iHKR20Y72tjQIUJs3UEjLBKNe8dzolWONti5Jsxv
         Xwl++aoDUdlikY4vX/AtgTrr0HGe8dEKfv7iIR3bGVl/IcuasEdEQHBtF4XQDFAzitu7
         FbExzsXnKCnX1QuQ2yDfeU+5RI5UPqFIjsr7xYl8WyC7/MOQr26WbTkruT7xx8m88XsR
         Wx+XWz4IWDShK8VhmSfHdIhviaHMuv5ku7WS7aFVRdDoqVP3L+fC1UaqUuoaCY3l1j+I
         FtUQ==
X-Gm-Message-State: AOAM531C1ieeETRLn4v1viPaR1u3msyW+i9MiFZ+RWPskImngrVOme9z
	Xfui6vH9obWrP2P/xFJyI9A8AfBeBz8JYDU7NQ4q26nDVnetIqZQlP2FxEuqRVOuPuWXinAePdc
	O7WcGdlY/QgyqGFXzPgE5OorV62CZKQFR
X-Received: by 2002:adf:db8b:0:b0:20f:fb4f:c3da with SMTP id u11-20020adfdb8b000000b0020ffb4fc3damr6798748wri.163.1654239182675;
        Thu, 02 Jun 2022 23:53:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOLHX0aJ3HCCTE752/lp0TycAuSWmxRG6uJvSvNncgae/lOYbOO4uYkuz3Oo2YI9QFwprQYw==
X-Received: by 2002:adf:db8b:0:b0:20f:fb4f:c3da with SMTP id u11-20020adfdb8b000000b0020ffb4fc3damr6798742wri.163.1654239182453;
        Thu, 02 Jun 2022 23:53:02 -0700 (PDT)
Received: from [172.28.2.131] (163.106.124.80.rev.sfr.net. [80.124.106.163])
        by smtp.gmail.com with ESMTPSA id m9-20020a05600c4f4900b003973435c517sm5418077wmq.0.2022.06.02.23.53.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jun 2022 23:53:01 -0700 (PDT)
Message-ID: <722055e6-0bc9-bb70-b729-3e211baee85e@redhat.com>
Date: Fri, 3 Jun 2022 08:53:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 0/8] Add a panel API to return panel orientation
To: Doug Anderson <dianders@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, Rob Clark <robdclark@chromium.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
References: <20220601094637.1200634-1-hsinyi@chromium.org>
 <CAD=FV=W+5GAUBh_ZMPeKhqxQXxau2OKCbt3p2QmsDhROf207dA@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAD=FV=W+5GAUBh_ZMPeKhqxQXxau2OKCbt3p2QmsDhROf207dA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220602_235311_870630_19EC424C 
X-CRM114-Status: GOOD (  22.99  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On 6/2/22 23:48, Doug Anderson wrote:
> Hi,
> 
> On Wed, Jun 1, 2022 at 2:46 AM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>>
>> Panels usually call drm_connector_set_panel_orientation(), which is
>> later than drm/kms driver calling drm_dev_register(). This leads to a
>> WARN()[1].
>>
>> The orientation property is known earlier. For example, some panels
>> parse the property through device tree during probe.
>>
>> The series add a panel API drm_panel_get_orientation() for drm/kms
>> drivers. The drivers can use the API to get panel's orientation, so they
>> can call drm_connector_set_panel_orientation() before drm_dev_register().
>>
>> Panel needs to implement .get_orientation callback to return the property.
>>
>> [1] https://patchwork.kernel.org/project/linux-mediatek/patch/20220530081910.3947168-2-hsinyi@chromium.org/
>>
>> Hsin-Yi Wang (8):
>>   drm/panel: Add an API drm_panel_get_orientation() to return panel
>>     orientation
>>   drm/panel: boe-tv101wum-nl6: Implement .get_orientation callback
>>   drm/panel: panel-edp: Implement .get_orientation callback
>>   drm/panel: lvds: Implement .get_orientation callback
>>   drm/panel: panel-simple: Implement .get_orientation callback
>>   drm/panel: ili9881c: Implement .get_orientation callback
>>   drm/panel: elida-kd35t133: Implement .get_orientation callback
>>   drm/mediatek: Config orientation property if panel provides it
>>
>>  drivers/gpu/drm/drm_panel.c                    |  8 ++++++++
>>  drivers/gpu/drm/mediatek/mtk_dsi.c             | 10 ++++++++++
>>  drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c |  8 ++++++++
>>  drivers/gpu/drm/panel/panel-edp.c              |  8 ++++++++
>>  drivers/gpu/drm/panel/panel-elida-kd35t133.c   |  8 ++++++++
>>  drivers/gpu/drm/panel/panel-ilitek-ili9881c.c  |  8 ++++++++
>>  drivers/gpu/drm/panel/panel-lvds.c             |  8 ++++++++
>>  drivers/gpu/drm/panel/panel-simple.c           |  9 +++++++++
>>  include/drm/drm_panel.h                        | 10 ++++++++++
>>  9 files changed, 77 insertions(+)
> 
> Seems reasonable to me. I added a request to the panel-edp patch that
> probably applies to all of the panel patches requesting a comment next
> to the old calls in get_modes().
> 
> I assume that all but patch #8 ought to land through drm-misc. I'm
> happy to help commit them once everyone is happy. If the Mediatek
> maintainer(s) want to Ack patch #8 I can land that in drm-misc too. If
> we want something fancier like an immutable branch you'll probably
> have to get someone involved that's got a higher drm pay grade than
> me. ;-)

Thanks, patch 8/8 looks good to me now too, so:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

for the series.

Note I'm currently travelling so I cannot push this to drm-mic-next
myself.

Regards,

Hans



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
