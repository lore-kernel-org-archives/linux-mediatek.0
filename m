From: "Frank Wunderlich" <frank-w-SipyoOjXbOMoAHOVJHB0wA@public.gmane.org>
Subject: Aw: Re: [PATCH V10 0/5] make mt7623 clock of hdmi stable
Date: Mon, 15 Apr 2019 20:00:14 +0200
Message-ID: <trinity-7d2e8af6-36b2-425d-a840-1a5588480edf-1555351214166@3c-app-gmx-bs71>
References: <20190409065307.82280-1-wangyan.wang@mediatek.com>
 <1554803700.4573.2.camel@mtksdaap41>
 <trinity-28840ab1-2bca-46d1-a6d4-374ba31aa2e2-1555261720443@3c-app-gmx-bs62>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <trinity-28840ab1-2bca-46d1-a6d4-374ba31aa2e2-1555261720443@3c-app-gmx-bs62>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Frank Wunderlich <frank-w-SipyoOjXbOMoAHOVJHB0wA@public.gmane.org>
Cc: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, chunhui dai <chunhui.dai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, wangyan wang <wangyan.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

Hi,

i got xserver and Framebuffer working on bananapi-r2/mt7623

see https://github.com/frank-w/BPI-R2-4.14/commits/5.1-hdmi-v10 for the used commits

i squashed some fixes into the original commits ("drm/mediatek: config component output by device node port","arm: dts: mt7623: add display subsystem related device nodes"), because they are not yet merged. hope this is ok

basicly these commits are needed on top of 5.1-rc5

3d72b35d4688 arm: dts: mt7623: add display subsystem related device nodes
176a2d716c5f fix boot up for 720 and 480 but 1080
f30d3fbc0e6e [hdmi] fix possible_crtcs
8cbd07f230dc drm/mediatek: config component output by device node port

take a look over it and please send it to mainline ;) because the clock-fixes and framebuffer (2 commits) already merged.

regards Frank
