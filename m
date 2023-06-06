Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3475C7EE24
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jun 2023 08:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DT7tX/M0mZeswTcyQ76BJ5csCzwyTHc+x7ptx2ezbp8=; b=oTIGA3QinRCpFKF4B+4ow86zwL
	ktUqUdZ00GASpxG2fhCBV9ARNvDCcc1yfDrYrcCYPIWYKHxjeWHOnQ+M+l+HTB8IExYmN2DZlT6ld
	YTh/IoVZNxEh0mKPzYdogN//KDHzXFf8xvGHSoDKxGmA3108Dx54yt6jY8gWEWs/SOaGij1neghvr
	zjkgiUU8DM3+He+qQ4gGxGtb6uE4LWztYi+nEvNuoD98zikcNlFoXf7Z1PlojJjb4Ve6xqbWVy2Mq
	bgpDEpMKVnoJvsR8F0+VqVwIIM0cT3w0EjEsAIvacZ4g5yLK0lf0PA4gSmt5IvdzEPDW9AB768a6q
	HLsq5yvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6S62-000otH-36;
	Tue, 06 Jun 2023 08:31:18 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6S5z-000osP-2A
	for linux-mediatek@lists.infradead.org;
	Tue, 06 Jun 2023 08:31:17 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3f7ebb2b82cso2356525e9.2
        for <linux-mediatek@lists.infradead.org>; Tue, 06 Jun 2023 01:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686040272; x=1688632272;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DT7tX/M0mZeswTcyQ76BJ5csCzwyTHc+x7ptx2ezbp8=;
        b=ThR3ZPojBZuNa5SebITHHHLz69z2YwEhjlSpMPiJyjgnwmhiz/LN9NLSLvD+S8VLc7
         6U17YZbtjDP/5W7mKjitp+tOeSWukLPalLABsgCOD0ShWpn7rGZXF3G+FK6a0oixax5V
         eFiJyxhdzeR2c0Xqtpu4l55WJ89F9FaMwWcCAiK6JEYUaL9BzVnrRObkFywMivztw50E
         wcnNPvhTPJWBMhQuspJ8fisxITYWKAhter9eyW/mOw9biO3L/Ovyh5TFsNLxx1AYL5u3
         kSBNL/FBHwu+5nBJkf40wgGZ8POT+J+/2CIXLZ+a7HDLJhOHgD9F/g1Ez5ISKpePhE1D
         ntfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686040272; x=1688632272;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DT7tX/M0mZeswTcyQ76BJ5csCzwyTHc+x7ptx2ezbp8=;
        b=lOkLokpotX3le2wddSZxU/SPuZctiUI009J9gtoJPyTMI9aqnu6jsBgYBPquLibNVi
         RMjCGtzbadS86Zl/3FOIhXoZzAxdxl5W9LcRhxjYPd1ugue4qkXqba6PUNTsDIV/gdk/
         gtqX+PIenC+hZIeoxVI8LedeE/6xRdbm48yUS8CnbqEUzQpSmnHfaVQmaZsgnXf+wZu6
         717zNhBC/hfmqGG+tZl6Lv6X00zpiaq1CZ22YuGf3vxWcGN1pGMcqKJCm9NvZcumbroi
         qIZu7uricwROSsCh6VhLPscl3elup0J+Acx1RWc9XDtYn9aw29yZU3GR20MPvUM148d4
         Oj4A==
X-Gm-Message-State: AC+VfDwIqRhdt7dk7qgSMi3hfs5q4pZTOkZJomd6YuQQdGCV4q1hjjef
	EE5QGQbxCsGiHgV1JmRbmkY5JQ==
X-Google-Smtp-Source: ACHHUZ7MeedmJigAdJfT4VOF4OxvbjiT8E6orSMe3JbtxiJdnacs5Gei7hfhQRlY8cLz8GUmy51qLw==
X-Received: by 2002:adf:e40d:0:b0:307:a6a9:9dd0 with SMTP id g13-20020adfe40d000000b00307a6a99dd0mr1197022wrm.20.1686040272102;
        Tue, 06 Jun 2023 01:31:12 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id n8-20020a5d4c48000000b00301a351a8d6sm11894004wrt.84.2023.06.06.01.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 01:31:10 -0700 (PDT)
Date: Tue, 6 Jun 2023 11:31:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: maxime@cerno.tech
Cc: linux-mediatek@lists.infradead.org
Subject: [bug report] drm/atomic: Pass the full state to planes async atomic
 check and update
Message-ID: <ZH7uy1C974HiCqru@moroto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_013115_712184_EA2A4F5E 
X-CRM114-Status: UNSURE (   7.30  )
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

Hello Maxime Ripard,

This is a semi-automatic email about new static checker warnings.

The patch 5ddb0bd4ddc3: "drm/atomic: Pass the full state to planes
async atomic check and update" from Feb 19, 2021, leads to the
following Smatch complaint:

    drivers/gpu/drm/mediatek/mtk_drm_plane.c:125 mtk_plane_atomic_async_check()
    warn: variable dereferenced before check 'state' (see line 106)

drivers/gpu/drm/mediatek/mtk_drm_plane.c
   103  static int mtk_plane_atomic_async_check(struct drm_plane *plane,
   104                                          struct drm_atomic_state *state)
   105  {
   106          struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
                                                                                         ^^^^^
The patch adds an unchecked dereference

   107                                                                                   plane);
   108          struct drm_crtc_state *crtc_state;
   109          int ret;
   110  
   111          if (plane != new_plane_state->crtc->cursor)
   112                  return -EINVAL;
   113  
   114          if (!plane->state)
   115                  return -EINVAL;
   116  
   117          if (!plane->state->fb)
   118                  return -EINVAL;
   119  
   120          ret = mtk_drm_crtc_plane_check(new_plane_state->crtc, plane,
   121                                         to_mtk_plane_state(new_plane_state));
   122          if (ret)
   123                  return ret;
   124  
   125          if (state)
                    ^^^^^
But the existing code has a check for NULL and comments explaining when
state can be NULL.

   126                  crtc_state = drm_atomic_get_existing_crtc_state(state,
   127                                                                  new_plane_state->crtc);
   128          else /* Special case for asynchronous cursor updates. */
   129                  crtc_state = new_plane_state->crtc->state;
   130  
   131          return drm_atomic_helper_check_plane_state(plane->state, crtc_state,
   132                                                     DRM_PLANE_NO_SCALING,
   133                                                     DRM_PLANE_NO_SCALING,
   134                                                     true, true);
   135  }

regards,
dan carpenter

