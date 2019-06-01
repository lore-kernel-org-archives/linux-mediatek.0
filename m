From: <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH net-next v1 1/6] dt-bindings: clock: mediatek: Add an extra
 required property to sgmiisys
Date: Sat, 1 Jun 2019 08:03:10 +0800
Message-ID: <1559347395-14058-2-git-send-email-sean.wang@mediatek.com>
References: <1559347395-14058-1-git-send-email-sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1559347395-14058-1-git-send-email-sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org
Cc: netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nbd-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

add an extra required property "mediatek,physpeed" to sgmiisys to determine
link speed to match up the capability of the target PHY.

Signed-off-by: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 .../devicetree/bindings/arm/mediatek/mediatek,sgmiisys.txt      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,sgmiisys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,sgmiisys.txt
index 30cb645c0e54..f5518f26a914 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,sgmiisys.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,sgmiisys.txt
@@ -9,6 +9,8 @@ Required Properties:
 	- "mediatek,mt7622-sgmiisys", "syscon"
 	- "mediatek,mt7629-sgmiisys", "syscon"
 - #clock-cells: Must be 1
+- mediatek,physpeed: Should be one of "auto", "1000" or "2500" to match up
+		     the capability of the target PHY.
 
 The SGMIISYS controller uses the common clk binding from
 Documentation/devicetree/bindings/clock/clock-bindings.txt
-- 
2.17.1
